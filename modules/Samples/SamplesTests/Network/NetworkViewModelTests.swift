//
//  NetworkViewModelTests.swift
//  SamplesTests
//
//  Copyright 2022 Thoughtworks, Inc. All rights reserved.
//  swiftlint:disable implicitly_unwrapped_optional

import XCTest
@testable import Samples
import Combine
import Alamofire

final class NetworkViewModelTests: XCTestCase {
    var dataSouce: MockDataSource!
    var repo: StandardNetworkRepository!
    var sut: NetworkViewModel!
    var bag: Set<AnyCancellable> = .init()
    let timeOut: TimeInterval = 10
    
    override func setUpWithError() throws {
        dataSouce = MockDataSource()
        repo = StandardNetworkRepository(dataSource: dataSouce)
        sut = NetworkViewModel(repository: repo)
    }
    func testResultShouldNotBeEmptyWhenMetohdIsGet() {
        request(.get)
    }
    
    func testResultShouldNotBeEmptyWhenMetohdIsPost() {
        request(.post)
    }
    
    func testResultShouldNotBeEmptyWhenMetohdIsPut() {
        request(.put)
    }
    
    func testResultShouldNotBeEmptyWhenMetohdIsDelete() {
        request(.delete)
    }
    
    func request(_ method: HTTPMethod) {
        // Given
        let expectation = expectation(description: #function)
        var result: NetworkFeatureData?
        
        sut.$currentData
            .dropFirst()
            .sink { value in
                result = value
                expectation.fulfill()
            }
            .store(in: &bag)
        
        // When
        sut.request(method)
        wait(for: [expectation], timeout: timeOut)
        
        // Then
        XCTAssertNotNil(result)
    }
    
    func testShouldBeErrorWhenResponseError() {
        // Given
        dataSouce.returError = true
        sut = NetworkViewModel(repository: repo)
        
        // When
        sut.request(.get)
        sut.request(.post)
        sut.request(.put)
        sut.request(.delete)
        
        // Then
        XCTAssertFalse(sut.errorMessage.isEmpty)
    }
}
