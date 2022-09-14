//
//  Interceptor.swift
//  Core
//
//  Copyright 2022 Thoughtworks, Inc. All rights reserved.
//

import Foundation
import Alamofire
import Combine

public struct RequestInterceptorsChain: RequestInterceptor {
    public static let `default`: RequestInterceptorsChain = {
        let networkReachableInterceptor = NetworkReachableInterceptor()

        var chain = RequestInterceptorsChain()
        chain.add(networkReachableInterceptor)
        return chain
    }()

    var interceptors: [RequestInterceptor] = []

    public mutating func add(_ interceptor: RequestInterceptor) {
        interceptors.append(interceptor)
    }

    public func adapt(
        _ urlRequest: URLRequest,
        for session: Session,
        completion: @escaping (Result<URLRequest, Swift.Error>
        ) -> Void) {
        let initial = CurrentValueSubject<URLRequest, Swift.Error>(urlRequest).eraseToAnyPublisher()
        _ = interceptors.publisher
            .map { interceptor in
                return { (request: URLRequest) in
                    return Future<URLRequest, Swift.Error> { promise in
                        interceptor.adapt(request, for: session, completion: promise)
                    }
                    .eraseToAnyPublisher()
                }
            }
            .reduce(initial) { latest, iii in
                return latest.flatMap(iii).eraseToAnyPublisher()
            }
            .flatMap { $0 }
            .sink { errorCompletion in
                if case .failure(let error) = errorCompletion {
                    completion(.failure(error))
                }
            } receiveValue: { urlRequest in
                completion(.success(urlRequest))
            }
    }
}

// MARK: -

public struct NetworkReachableInterceptor: RequestInterceptor {
    public enum Error: Equatable, Swift.Error {
        case unreachableNetwork
    }

    var isNetworkReachable: () -> Bool = { NetworkReachabilityManager.default?.isReachable ?? false }

    public func adapt(
        _ urlRequest: URLRequest,
        for session: Session,
        completion: @escaping (Result<URLRequest, Swift.Error>) -> Void
    ) {
        let success = Result<URLRequest, Swift.Error>.success(urlRequest)
        let failure = Result<URLRequest, Swift.Error>.failure(Error.unreachableNetwork)
        completion(isNetworkReachable() ? success : failure)
    }
}

// MARK: -

public struct HeaderInterceptor: RequestInterceptor {
    typealias Headers = [String: String]?

    let modifier: (Headers) -> Headers

    init(_ modifier: @escaping (Headers) -> Headers) {
        self.modifier = modifier
    }

    public func adapt(
        _ urlRequest: URLRequest,
        for session: Session,
        completion: @escaping (Result<URLRequest, Error>) -> Void
    ) {
        var newRequest = urlRequest
        newRequest.allHTTPHeaderFields = modifier(urlRequest.allHTTPHeaderFields)
        completion(.success(newRequest))
    }
}
