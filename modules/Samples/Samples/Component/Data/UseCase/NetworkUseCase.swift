//
//  NetworkUseCase.swift
//  Samples
//
//  Copyright 2022 Thoughtworks, Inc. All rights reserved
//

import Combine
import Alamofire

class NetworkUseCase {
    private let repository: NetworkRepository
    
    init(repository: NetworkRepository) {
        self.repository = repository
    }
    
    func request(_ method: HTTPMethod) -> AnyPublisher<NetworkFeatureData, Error> {
        switch method {
        case .get:
            return repository.makeGetRequest()
        case .post:
            return repository.makePostRequest()
        case .put:
            return repository.makePutRequest()
        case .delete:
            return repository.makeDeleteRequest()
        default:
            return Fail(error: ApiError.serverError).eraseToAnyPublisher()
        }
    }
}
