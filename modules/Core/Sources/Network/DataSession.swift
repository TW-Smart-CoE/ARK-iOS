//
//  DataSession.swift
//  Core
//
//  Copyright 2022 Thoughtworks, Inc. All rights reserved.
//

import Combine
import Alamofire

public class DataSession: Session {
    public enum Error: Equatable, Swift.Error {
        case unreachableNetwork
        case unknown(description: String?)
    }

    public typealias Request = URLRequest
    public typealias Response = Data

    let session: Alamofire.Session

    var isNetworkReachable: () -> Bool = { NetworkReachabilityManager.default?.isReachable ?? false }

    public init(session: Alamofire.Session = .default) {
        self.session = session
    }

    public func resume(_ request: URLRequest, response: @escaping (Result<Data, Swift.Error>) -> Void) {
        self.session.request(request).responseData { resp in
            switch (resp.data, resp.error) {
            case let (data?, _):
                response(.success(data))
            case let (_, error?):
                response(.failure(error))
            default:
                response(.failure(Error.unknown(description: nil)))
            }
        }
    }

    public func intercept(_ request: Request, completion: @escaping (Result<Request, Swift.Error>) -> Void) {
        guard isNetworkReachable() else {
            completion(Result.failure(Error.unreachableNetwork))
            return
        }
        completion(.success(request))
    }
}
