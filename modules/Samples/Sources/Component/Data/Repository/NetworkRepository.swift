//
//  NetworkRepository.swift
//  Samples
//
//  Copyright 2022 Thoughtworks, Inc. All rights reserved
//

import Foundation
import Combine

public protocol NetworkRepository {
    func makeGetRequest() -> AnyPublisher<NetworkFeatureData, Error>
    
    func makePostRequest() -> AnyPublisher<NetworkFeatureData, Error>
    
    func makePutRequest() -> AnyPublisher<NetworkFeatureData, Error>
    
    func makeDeleteRequest() -> AnyPublisher<NetworkFeatureData, Error>
}
