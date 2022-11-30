//
//  CodeleExtensionTests.swift
//  SamplesTests
//
//  Copyright 2022 Thoughtworks, Inc. All rights reserved
//

import XCTest
@testable import Samples

struct CodableData: Codable {
    let data: String
}

final class CodableExtensionTests: XCTestCase {
    func testResultIsNotEmptyWhenDataIsCodable() {
        let data = CodableData(data: "data")
        let result = data.toJSONString()
        XCTAssertFalse(result.isEmpty)
    }
}
