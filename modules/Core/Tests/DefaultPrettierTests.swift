//
//  PrettierTests.swift
//  Core
//
//  Copyright 2022 Thoughtworks, Inc. All rights reserved.
//

@testable import Core
import XCTest

class DefaultPrettierTests: XCTestCase {
    let prettier: DefaultPrettier = DefaultPrettier()

    func testShouldReturnExpectedString_whenCallPretify() {
        /// when

        let thread = Thread()
        thread.name = "test_thread"
        let date = Date(timeIntervalSince1970: 1000)
        let file = "path/to/file.swift"
        let line = 100
        let message = "messsage"

        let record = LogRecord(
            level: "INFO",
            tag: "tag",
            thread: thread,
            date: date,
            file: file,
            line: line,
            message: message
        )

        let result = prettier.prettify(record)

        /// should
        let expected =
"""
[INFO][tag][test_thread][\(date)][file.swift:100]
\(message)

"""
XCTAssertEqual(result, expected)
    }

    func testShouldReturnFileName_whenGetFileNameOfAValidPath() {
        let path = "path/to/file.swift"

        /// when
        let name = prettier.fileName(of: path)

        /// then
        XCTAssertEqual(name, "file.swift")
    }

    func testShouldReturnUnknowFlie_whenGetFileNameOfAnInvalidPath() {
        let path = ""

        /// when
        let name = prettier.fileName(of: path)

        /// then
        XCTAssertEqual(name, DefaultPrettier.UnkownFile)
    }
}
