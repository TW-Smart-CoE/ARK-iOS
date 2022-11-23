//
//  NetworkRepository.swift
//  Samples
//
//  Created by Renjun Li on 2022/11/23.
//

import Foundation
import Combine

protocol NetworkRepository {
    func makeGetRequest() -> AnyPublisher<NetworkFeatureData, Error>
    
    func makePostRequest() -> AnyPublisher<NetworkFeatureData, Error>
    
    func makePutRequest() -> AnyPublisher<NetworkFeatureData, Error>
    
    func makeDeleteRequest() -> AnyPublisher<NetworkFeatureData, Error>
}
