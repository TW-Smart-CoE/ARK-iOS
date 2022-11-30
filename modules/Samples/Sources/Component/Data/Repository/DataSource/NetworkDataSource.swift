//
//  NetworkDataSource.swift
//  Samples
//
//  Copyright 2022 Thoughtworks, Inc. All rights reserved
//

import Foundation
import Combine

public protocol NetworkDataSource {
    func makeGetRequest() -> AnyPublisher<NetworkResponse, Error>
    
    func makePostRequest() -> AnyPublisher<NetworkResponse, Error>
    
    func makePutRequest() -> AnyPublisher<NetworkResponse, Error>
    
    func makeDeleteRequest() -> AnyPublisher<NetworkResponse, Error>
}
