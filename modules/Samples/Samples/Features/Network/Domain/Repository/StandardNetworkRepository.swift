//
//  StandardNetworkRepository.swift
//  Samples
//
//  Created by Renjun Li on 2022/11/23.
//

import Foundation
import Combine
import Core
import Alamofire

enum ApiError: Error {
    case dataParseError
    case serverError
}

class StandardNetworkRepository: NetworkRepository {
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
    
    func makeGetRequest() -> AnyPublisher<NetworkFeatureData, Error> {
        // optional: add interceptor
        var chain = RequestInterceptorsChain.default
        chain.add(LogInterceptor())
        let request = service.request(path: Constants.getPath, interceptor: chain)
        return handleResponse(request)
    }
    
    func makePostRequest() -> AnyPublisher<NetworkFeatureData, Error> {
        let request = service.request(path: Constants.postPath, method: .post)
        return handleResponse(request)
    }
    
    func makePutRequest() -> AnyPublisher<NetworkFeatureData, Error> {
        let request = service.request(path: Constants.putPath, method: .put)
        return handleResponse(request)
    }
    
    func makeDeleteRequest() -> AnyPublisher<NetworkFeatureData, Error> {
        let request = service.request(path: Constants.deletePath, method: .delete)
        return handleResponse(request)
    }
   
    private func handleResponse(_ request: Alamofire.DataRequest) -> AnyPublisher<NetworkFeatureData, Error> {
        return Future<NetworkFeatureData, Error> { promise in
            request.response { afResponse in
                switch afResponse.result {
                case .success(let data):
                    guard let data = data else { return promise(.failure(ApiError.dataParseError)) }
                    do {
                        let decoder = JSONDecoder()
                        let response = try decoder.decode(NetworkResponse.self, from: data)
                        let result = NetworkMapper.transform(response)
                        Log.info(tag: "response", message: "\(result)")
                        promise(.success(result))
                    } catch {
                        promise(.failure(ApiError.dataParseError))
                    }
                case .failure:
                    promise(.failure(ApiError.serverError))
                }
            }
        }
        .eraseToAnyPublisher()
    }
}
