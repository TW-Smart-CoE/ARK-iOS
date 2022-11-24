//
//  CodeleExtensionTests.swift
//  SamplesTests
//
//  Created by Renjun Li on 2022/11/24.
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
