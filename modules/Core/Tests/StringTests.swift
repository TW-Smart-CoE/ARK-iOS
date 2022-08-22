//
//  StringTests.swift
//  Core
//
//  Copyright 2022 Thoughtworks, Inc. All rights reserved.
//

import Core
import XCTest

class StringTests: XCTestCase {
    func test_givenStringType_whenGetAEmptyString_thenReturnExpectedEmptySting() {
        /// given
        let expected = ""

        /// when
        let result = String.empty

        /// then
        XCTAssertEqual(result, expected)
    }
}
