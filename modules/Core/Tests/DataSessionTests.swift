//
//  DataSessionTests.swift
//  Core
//
//  Copyright 2022 Thoughtworks, Inc. All rights reserved.
//

import XCTest
@testable import Core

class DataSessionTests: XCTestCase {
    let dataSession = DataSession()

    var validRequest: URLRequest { URLRequest(url: URL(string: "https://www.thoughtworks.com")!) }
    var invalidRequest: URLRequest { URLRequest(url: URL(string: "https://invalid-host.com")!) }

    func test_ShouldSuccess_whenRequestAValidURL() throws {
        let successed = XCTestExpectation()
        dataSession.resumeWithInterceptor(validRequest) { result in
            switch result {
            case .success: successed.fulfill()
            case .failure: break
            }
        }
        wait(for: [successed], timeout: 2.0)
    }

    func test_ShouldFailed_whenRequestAInvalidURL() throws {
        let failed = XCTestExpectation()
        dataSession.resumeWithInterceptor(invalidRequest) { result in
            switch result {
            case .failure: failed.fulfill()
            default: break
            }
        }
        wait(for: [failed], timeout: 2.0)
    }

    func test_ShouldFailed_whenNetworkIsUnreachable() {
        _ = dataSession.isNetworkReachable
        dataSession.isNetworkReachable = { false }

        let failed = XCTestExpectation()
        dataSession.resumeWithInterceptor(invalidRequest) { result in
            switch result {
            case .failure(let error) where (error as? DataSession.Error) == DataSession.Error.unreachableNetwork:
                failed.fulfill()
            default: break
            }
        }
        wait(for: [failed], timeout: 2.0)
    }
}
