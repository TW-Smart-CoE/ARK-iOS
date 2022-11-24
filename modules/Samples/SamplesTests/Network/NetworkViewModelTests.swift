//
//  NetworkViewModelTests.swift
//  ExamplesTests
//
//  Copyright 2022 Thoughtworks, Inc. All rights reserved.
//  swiftlint:disable implicitly_unwrapped_optional

import XCTest
@testable import Samples
import Combine
import Alamofire

final class NetworkViewModelTests: XCTestCase {
    let repo = MockNetworRepository()
    var sut: NetworkViewModel!
    var bag: Set<AnyCancellable> = .init()
    let timeOut: TimeInterval = 10
    
    override func setUpWithError() throws {
        sut = NetworkViewModel(repository: repo)
    }
    
    func testResultShouldNotEmptyWhenMetohdIsGet() {
        makeRequest(.get)
    }
    
    func testResultShouldNotEmptyWhenMetohdIsPost() {
        makeRequest(.post)
    }
    
    func testResultShouldNotEmptyWhenMetohdIsPut() {
        makeRequest(.put)
    }
    
    func testResultShouldNotEmptyWhenMetohdIsDelete() {
        makeRequest(.delete)
    }
    
    func makeRequest(_ method: HTTPMethod) {
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
        let repo = MockNetworRepository()
        repo.returError = true
        sut = NetworkViewModel(repository: repo)
        
        // When
        sut.request(.get)
        
        // Then
        XCTAssertEqual(sut.uiState, .error)
    }
}

class MockNetworRepository: NetworkRepository {
    let responseData = NetworkFeatureData(
        accept: "accept",
        acceptEncoding: "acceptEncoding",
        acceptLanguage: "acceptLanguage",
        host: "host",
        userAgent: "userAgent",
        origin: "origin",
        url: "url"
    )
    
    var returError: Bool = false
    
    func makeGetRequest() -> AnyPublisher<NetworkFeatureData, Error> {
        return makeResponse()
    }
    
    func makePostRequest() -> AnyPublisher<NetworkFeatureData, Error> {
        return makeResponse()
    }
    
    func makePutRequest() -> AnyPublisher<NetworkFeatureData, Error> {
        return makeResponse()
    }
    
    func makeDeleteRequest() -> AnyPublisher<NetworkFeatureData, Error> {
        return makeResponse()
    }
    
    private func makeResponse() -> AnyPublisher<NetworkFeatureData, Error> {
        guard !returError else {
            return Fail(error: NSError(domain: "Error", code: -1)).eraseToAnyPublisher()
        }
        return Just(responseData).setFailureType(to: Error.self).eraseToAnyPublisher()
    }
}
