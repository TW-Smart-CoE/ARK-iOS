//
//  NetworkMapperTests.swift
//  SamplesTests
//
//  Created by Renjun Li on 2022/11/24.
//
import XCTest
@testable import Samples

final class NetworkMapperTests: XCTestCase {
    func testTransform() {
        let serverResponse = NetworkResponse(
            origin: "origin",
            url: "url",
            header: NetworkResponseHeader(
                accept: "accept",
                acceptEncoding: "acceptEncoding",
                acceptLanguage: "acceptLanguage",
                host: "host",
                userAgent: "userAgent")
        )
        let result = NetworkMapper.transform(serverResponse)
        
        XCTAssertEqual(serverResponse.origin, result.origin)
        XCTAssertEqual(serverResponse.url, result.url)
        XCTAssertEqual(serverResponse.header.accept, result.accept)
        XCTAssertEqual(serverResponse.header.acceptEncoding, result.acceptEncoding)
        XCTAssertEqual(serverResponse.header.acceptLanguage, result.acceptLanguage)
        XCTAssertEqual(serverResponse.header.host, result.host)
        XCTAssertEqual(serverResponse.header.userAgent, result.userAgent)
    }
}
