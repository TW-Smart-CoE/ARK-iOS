//
//  RemoteBinDataSource.swift
//  Samples
//
//  Copyright 2022 Thoughtworks, Inc. All rights reserved
//

import Foundation
import Combine
import Core
import Alamofire

enum ApiError: Error {
    case dataParseError
    case serverError(Error)
    case unkown
}

class RemoteBinDataSource: BinDataSource {
    enum Constants {
        static let getPath = "/get"
        static let postPath = "/post"
        static let putPath = "/put"
        static let deletePath = "/delete"
    }
    private let service: BaseURLService
    
    init(service: BaseURLService) {
        self.service = service
    }
    
    func makeGetRequest() -> AnyPublisher<NetworkResponse, Error> {
        // optional: add interceptor
        var chain = RequestInterceptorsChain.default
        chain.add(LogInterceptor())
        let request = service.request(path: Constants.getPath, interceptor: chain)
        return handleRequest(request)
    }
    
    func makePostRequest() -> AnyPublisher<NetworkResponse, Error> {
        let request = service.request(path: Constants.postPath, method: .post)
        return handleRequest(request)
    }
    
    func makePutRequest() -> AnyPublisher<NetworkResponse, Error> {
        let request = service.request(path: Constants.putPath, method: .put)
        return handleRequest(request)
    }
    
    func makeDeleteRequest() -> AnyPublisher<NetworkResponse, Error> {
        let request = service.request(path: Constants.deletePath, method: .delete)
        return handleRequest(request)
    }
   
    private func handleRequest(_ request: Alamofire.DataRequest) -> AnyPublisher<NetworkResponse, Error> {
        return Future<NetworkResponse, Error> { promise in
            request.response { afResponse in
                switch afResponse.result {
                case .success(let data):
                    guard let data = data else { return promise(.failure(ApiError.dataParseError)) }
                    do {
                        let decoder = JSONDecoder()
                        let response = try decoder.decode(NetworkResponse.self, from: data)
                        Log.info(tag: "response", message: "\(response)")
                        promise(.success(response))
                    } catch {
                        promise(.failure(ApiError.dataParseError))
                    }
                case .failure(let error):
                    promise(.failure(ApiError.serverError(error)))
                }
            }
        }
        .eraseToAnyPublisher()
    }
}
