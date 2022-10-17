//
//  LogModifier.swift
//  Core
//
//  Copyright 2022 Thoughtworks, Inc. All rights reserved.
//

import Foundation

public protocol LogModifier {
    func modify(_ record: any LogRecording) -> (any LogRecording)?
}

public class LogModifiersChain: LogModifier {
    public private(set) var modifiers: [LogModifier]

    init(modifiers: [LogModifier]) {
        self.modifiers = modifiers
    }

    public func add(_ modifier: LogModifier) {
        self.modifiers.append(modifier)
    }

    public func modify(_ record: any LogRecording) -> (any LogRecording)? {
        return self.modifiers.reduce(record) { partialResult, modifier in
            partialResult.flatMap(modifier.modify)
        }
    }
}
