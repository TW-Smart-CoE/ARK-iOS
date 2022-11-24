//
//  BinDataSource.swift
//  Samples
//
//  Created by Renjun Li on 2022/11/24.
//

import Foundation
import Combine

public protocol BinDataSource {
    func makeGetRequest() -> AnyPublisher<NetworkResponse, Error>
    
    func makePostRequest() -> AnyPublisher<NetworkResponse, Error>
    
    func makePutRequest() -> AnyPublisher<NetworkResponse, Error>
    
    func makeDeleteRequest() -> AnyPublisher<NetworkResponse, Error>
}
