//
//  APIServiceTests.swift
//  Core
//
//  Copyright 2022 Thoughtworks, Inc. All rights reserved.
//

import XCTest
@testable import Core
import Combine

class APIServiceTests: XCTestCase {
    let service = APIService.default.withBaseURL("https://www.wanandroid.com")

    var validRequest: URLRequest { URLRequest(url: URL(string: "https://www.thoughtworks.com")!) }
    var invalidRequest: URLRequest { URLRequest(url: URL(string: "https://invalid-host.com")!) }

    func test_ShouldSuccess_whenRequestAValidURL() throws {
        let successed = XCTestExpectation()
        service.request(path: "/friend/json")
            .responseData { response in
                if response.data != nil {
                    successed.fulfill()
                }
            }
        wait(for: [successed], timeout: 5.0)
    }

    func test_ShouldFailed_whenRequestAInvalidURL() throws {
        let failed = XCTestExpectation()
        service.request(path: "/invalid/path")
            .responseData { response in
                switch response.response!.statusCode {
                case 400...499: failed.fulfill()
                default: break
                }
            }
        wait(for: [failed], timeout: 5.0)
    }

    func test_ShouldAddHeaders_whenHeaderInterceptorApplied() {
        let (headerKey, headerValue) = ("NewHeaderKey", "NewHeaderValue")
        let interceptor = HeaderInterceptor { _ in
            [headerKey: headerValue]
        }

        let newHeaderApplied = XCTestExpectation()
        service.request(path: "/invalid/path", interceptor: interceptor)
            .response { response in
                let exist = response.request?.headers
                    .contains { $0.name == headerKey && $0.value == headerValue } ?? false
                if exist {
                    newHeaderApplied.fulfill()
                }
            }
        wait(for: [newHeaderApplied], timeout: 5.0)
    }

    func test_ShouldFailed_whenNetworkIsUnreachableAndNetworkReachableInterceptorApplied() {
        var interceptor = NetworkReachableInterceptor()
        interceptor.isNetworkReachable = { false }

        let failedWithNetworkError = XCTestExpectation()
        service.request(path: "/friend/json", interceptor: interceptor)
            .response { response in
                switch response.error {
                case let .requestAdaptationFailed(error: error):
                    if let unreableError = error as? NetworkReachableInterceptor.Error,
                        unreableError == .unreachableNetwork {
                        failedWithNetworkError.fulfill()
                    }
                default: break
                }
            }
        wait(for: [failedWithNetworkError], timeout: 5.0)
    }

    func test_ShouldInterctetorApplied_whenUseRequestInterceptorsChain() {
        let newHeaderApplied = XCTestExpectation()
        let (headerKey, headerValue) = ("NewHeaderKey", "NewHeaderValue")
        let headerInterceptor = HeaderInterceptor { _ in
            newHeaderApplied.fulfill()
            return [headerKey: headerValue]
        }

        var networkReachableInterceptor = NetworkReachableInterceptor()
        networkReachableInterceptor.isNetworkReachable = { false }

        var chain = RequestInterceptorsChain()
        chain.add(headerInterceptor)
        chain.add(networkReachableInterceptor)

        let failedWithNetworkError = XCTestExpectation()
        service.request(path: "/friend/json", interceptor: chain)
            .response { response in
                switch response.error {
                case let .requestAdaptationFailed(error: error):
                    if let unreableError = error as? NetworkReachableInterceptor.Error,
                        unreableError == .unreachableNetwork {
                        failedWithNetworkError.fulfill()
                    }
                default: break
                }
            }
        wait(for: [newHeaderApplied, failedWithNetworkError], timeout: 5.0)
    }
}
