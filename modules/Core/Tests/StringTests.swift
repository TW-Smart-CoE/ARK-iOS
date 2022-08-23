//
//  StringTests.swift
//  Core
//
//  Copyright 2022 Thoughtworks, Inc. All rights reserved.
//

import Core
import XCTest

class StringTests: XCTestCase {
    func testShouldReturnExpectedEmptySting_whenGetEmptyString() {
        /// when
        let expected = ""
        let result = String.empty

        /// should
        XCTAssertEqual(result, expected)
    }
}
