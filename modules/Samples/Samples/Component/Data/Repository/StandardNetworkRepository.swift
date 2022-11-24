//
//  StandardNetworkRepository.swift
//  Samples
//
//  Copyright 2022 Thoughtworks, Inc. All rights reserved
//

import Foundation
import Combine
import Core
import Alamofire

class StandardNetworkRepository: NetworkRepository {
    private let dataSource: BinDataSource
    
    init(dataSource: BinDataSource) {
        self.dataSource = dataSource
    }
    
    func makeGetRequest() -> AnyPublisher<NetworkFeatureData, Error> {
        return dataSource.makeGetRequest()
            .map { NetworkMapper.transform($0) }
            .eraseToAnyPublisher()
    }
    
    func makePostRequest() -> AnyPublisher<NetworkFeatureData, Error> {
        return dataSource.makeGetRequest()
            .map { NetworkMapper.transform($0)}
            .eraseToAnyPublisher()
    }
    
    func makePutRequest() -> AnyPublisher<NetworkFeatureData, Error> {
        return dataSource.makeGetRequest()
            .map { NetworkMapper.transform($0) }
            .eraseToAnyPublisher()
    }
    
    func makeDeleteRequest() -> AnyPublisher<NetworkFeatureData, Error> {
        return dataSource.makeGetRequest()
            .map { NetworkMapper.transform($0) }
            .eraseToAnyPublisher()
    }
}
