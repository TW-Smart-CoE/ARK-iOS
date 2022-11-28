//
//  NetworkUseCaseTests.swift
//  SamplesTests
//
//  Copyright 2022 Thoughtworks, Inc. All rights reserved
//

import XCTest
@testable import Samples
import Combine
import Alamofire

// swiftlint:disable implicitly_unwrapped_optional
final class NetworkUseCaseTests: XCTestCase {
    var sut: NetworkUseCase!
    var repository: MockNetworkRepository!
    var bag: Set<AnyCancellable> = .init()
    
    override func setUpWithError() throws {
        try super.setUpWithError()
        repository = MockNetworkRepository()
        sut = NetworkUseCase(repository: repository)
    }
    
    func testResultShouldNotBeEmptyWhenMetohdIsGet() {
        testResultShouldNotBeEmptyWhenMethod(is: .get)
    }
    
    func testResultShouldNotBeEmptyWhenMetohdIsPost() {
        testResultShouldNotBeEmptyWhenMethod(is: .post)
    }
    
    func testResultShouldNotBeEmptyWhenMetohdIsPut() {
        testResultShouldNotBeEmptyWhenMethod(is: .put)
    }
    
    func testResultShouldNotBeEmptyWhenMetohdIsDelete() {
        testResultShouldNotBeEmptyWhenMethod(is: .delete)
    }
    
    func testResultShouldBeErrorWhenMetohdIsNotBeSupported() {
        // Given
        let expectation = expectation(description: #function)
        let method: HTTPMethod = .patch
        
        // When
        let response = makeRequest(method)
        var isError: Bool = false
        
        response.sink(
            receiveCompletion: { completion in
                switch completion {
                case .failure:
                    isError = true
                    expectation.fulfill()
                case .finished:
                    break
                }
            }, receiveValue: { _ in
                XCTFail("It should not be here")
            }
        )
        .store(in: &bag)
        wait(for: [expectation], timeout: 3)
        
        // Then
        XCTAssertTrue(isError)
    }
    
    func testResultShouldNotBeEmptyWhenMethod(is method: HTTPMethod) {
        // Given
        let expectation = expectation(description: #function)
        var result: NetworkFeatureData?
        
        // When
        let response = makeRequest(method)
        response.sink(
            receiveCompletion: { completion in
                switch completion {
                case .failure:
                    XCTFail("It should not be here")
                case .finished:
                    break
                }
            }, receiveValue: { value in
                result = value
                expectation.fulfill()
            }
        )
        .store(in: &bag)
        wait(for: [expectation], timeout: 3)
        
        // Then
        XCTAssertNotNil(result)
    }
    
    func makeRequest(_ method: HTTPMethod) -> AnyPublisher<NetworkFeatureData, Error> {
        let response = sut.request(method)
        return response
    }
    
    func testShouldBeErrorWhenResponseError() {
        // Given
        repository = MockNetworkRepository()
        sut = NetworkUseCase(repository: repository)
        repository.returError = true
        let expectation = expectation(description: #function)
        var isError: Bool = true
        
        // When
        let response = makeRequest(.get)
        response.sink(
            receiveCompletion: { completion in
                switch completion {
                case .failure:
                    isError = true
                    expectation.fulfill()
                case .finished:
                    XCTFail("It should be error")
                }
            }, receiveValue: { _ in
                XCTFail("It should be error")
            }
        )
        .store(in: &bag)
        wait(for: [expectation], timeout: 3)
        
        // Then
        XCTAssertTrue(isError)
    }
}

class MockNetworkRepository: NetworkRepository {
    let responseData = NetworkFeatureData(
        accept: "origin",
        acceptEncoding: "url",
        acceptLanguage: "accept",
        host: "acceptEncoding",
        userAgent: "acceptLanguage",
        origin: "host",
        url: "userAgent"
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
