//
//  LogModifier.swift
//  Core
//
//  Copyright 2022 Thoughtworks, Inc. All rights reserved.
//

import Foundation

public protocol LogModifier {
    func modify(_ record: LogRecord) -> LogRecord?
}

public class LogModifiersChain: LogModifier {
    public private(set) var modifiers: [LogModifier]

    init(modifiers: [LogModifier]) {
        self.modifiers = modifiers
    }

    public func add(_ modifier: LogModifier) {
        self.modifiers.append(modifier)
    }

    public func modify(_ record: LogRecord) -> LogRecord? {
        return self.modifiers.reduce(record as LogRecord?) { partialResult, modifier in
            partialResult.flatMap(modifier.modify)
        }
    }
}
