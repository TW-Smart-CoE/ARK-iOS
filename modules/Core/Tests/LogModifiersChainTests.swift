//
//  LogModifiersChainTests.swift
//  Core
//
//  Copyright 2022 Thoughtworks, Inc. All rights reserved.
//

@testable import Core
import XCTest

class LogModifiersChainTests: XCTestCase {
    func testShouldIgnoreTheRestModifiers_whenAModifierReturnNil() {
        let record = LogRecord(
            level: .empty,
            tag: .empty,
            thread: Thread(),
            date: Date(),
            file: .empty,
            line: 0,
            message: .empty
        )

        let modifiers = [
            MockModifier(),
            MockModifier()
        ]

        let prettier: LogModifiersChain = LogModifiersChain(modifiers: modifiers)

        // when
        _ = prettier.modify(record)

        // should
        XCTAssertTrue(modifiers[0].isCalled)
        XCTAssertFalse(modifiers[1].isCalled)
    }

    func testShouldCallAllModifiers_whenAllModifierReturnValue() {
        let record = LogRecord(
            level: .empty,
            tag: .empty,
            thread: Thread(),
            date: Date(),
            file: .empty,
            line: 0,
            message: .empty
        )

        let modifiers = [
            MockModifier(record: record),
            MockModifier(record: record)
        ]

        let prettier: LogModifiersChain = LogModifiersChain(modifiers: [])
        modifiers.forEach(prettier.add(_:))

        // when
        _ = prettier.modify(record)

        // should
        XCTAssertTrue(modifiers.map(\.isCalled).allSatisfy { $0 })
    }
}

private class MockModifier: LogModifier {
    private(set) var isCalled: Bool = false
    private let record: LogRecord?

    init(record: LogRecord? = nil) {
        self.record = record
    }

    func modify(_ record: LogRecord) -> LogRecord? {
        isCalled = true
        return self.record
    }
}
