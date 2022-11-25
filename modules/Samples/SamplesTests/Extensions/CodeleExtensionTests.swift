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

final class CodeleExtensionTests: XCTestCase {
    func testResultISNotEmptyWhenDataIsCodable() {
        let data = CodableData(data: "data")
        let result = data.toJSONString()
        XCTAssertFalse(result.isEmpty)
    }
}
