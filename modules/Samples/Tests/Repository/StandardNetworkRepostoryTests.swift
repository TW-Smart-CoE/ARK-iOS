//
//  StandardNetworkRepostoryTests.swift
//  SamplesTests
//
//  Copyright 2022 Thoughtworks, Inc. All rights reserved
//

import XCTest
@testable import Samples
import Combine
import Alamofire

// swiftlint:disable implicitly_unwrapped_optional
final class StandardNetworkRepostoryTests: XCTestCase {
    var sut: StandardNetworkRepository!
    var dataSource: MockDataSource!
    var bag: Set<AnyCancellable> = .init()
    
    override func setUpWithError() throws {
        try super.setUpWithError()
        dataSource = MockDataSource()
        sut = StandardNetworkRepository(dataSource: dataSource)
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
        var response: AnyPublisher<NetworkFeatureData, Error>?
        switch method {
        case .get:
            response = sut.makeGetRequest()
        case .post:
            response = sut.makePostRequest()
        case .put:
            response = sut.makePutRequest()
        case .delete:
            response = sut.makeDeleteRequest()
        default:
            XCTFail("we do not support the method:\(method.rawValue)")
        }
        return response!
    }
    
    func testShouldBeErrorWhenResponseError() {
        // Given
        dataSource = MockDataSource()
        sut = StandardNetworkRepository(dataSource: dataSource)
        dataSource.returError = true
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

class MockDataSource: NetworkDataSource {
    let responseData = NetworkResponse(
        origin: "origin",
        url: "url",
        header: .init(
            accept: "accept",
            acceptEncoding: "acceptEncoding",
            acceptLanguage: "acceptLanguage",
            host: "host",
            userAgent: "userAgent"
        )
    )
    
    var returError: Bool = false
    
    func makeGetRequest() -> AnyPublisher<NetworkResponse, Error> {
        return makeResponse()
    }
    
    func makePostRequest() -> AnyPublisher<NetworkResponse, Error> {
        return makeResponse()
    }
    
    func makePutRequest() -> AnyPublisher<NetworkResponse, Error> {
        return makeResponse()
    }
    
    func makeDeleteRequest() -> AnyPublisher<NetworkResponse, Error> {
        return makeResponse()
    }
    
    private func makeResponse() -> AnyPublisher<NetworkResponse, Error> {
        guard !returError else {
            return Fail(error: NSError(domain: "Error", code: -1)).eraseToAnyPublisher()
        }
        return Just(responseData).setFailureType(to: Error.self).eraseToAnyPublisher()
    }
}
