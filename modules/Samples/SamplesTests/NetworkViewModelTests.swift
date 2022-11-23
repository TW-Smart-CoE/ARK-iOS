//
//  NetworkViewModelTests.swift
//  ExamplesTests
//
//  Copyright 2022 Thoughtworks, Inc. All rights reserved.
//

import XCTest
@testable import Samples
import Combine
import Alamofire

final class NetworkViewModelTests: XCTestCase {
    let sut =  NetworkViewModel()
    var bag: Set<AnyCancellable> = .init()
    let timeOut: TimeInterval = 10
    
    override func setUpWithError() throws { }
    
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
        var result = ""
        sut.$result
            .dropFirst()
            .dropFirst()
            .sink { value in
                result = value
                expectation.fulfill()
            }
            .store(in: &bag)
        
        // When
        sut.request(.get)
        wait(for: [expectation], timeout: timeOut)
        
        // Then
        XCTAssertTrue(!result.isEmpty)
    }
}
