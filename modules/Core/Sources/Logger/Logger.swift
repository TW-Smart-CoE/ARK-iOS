//
//  Logger.swift
//  Core
//
//  Copyright 2022 Thoughtworks, Inc. All rights reserved.
//

import Foundation

// swiftlint:disable identifier_name
public let Log = Logger.default
// swiftlint:enable identifier_name

public struct Logger: LoggerRepresentable {
    public static let `default`: Logger = Logger()

    var prettier: Prettier
    var outputStream: TextOutputStream
    var modifier: LogModifier

    init(
        prettier: Prettier = DefaultPrettier(),
        outputStream: TextOutputStream = DefaultOutputStream(),
        modifier: LogModifier = LogModifiersChain(modifiers: [SensitiveInfoProtector()])
    ) {
        self.prettier = prettier
        self.outputStream = outputStream
        self.modifier = modifier
    }

    public func log(_ record: LogRecord) {
        if let prettified = modifier.modify(record).flatMap(prettier.prettify) {
            var outputStream = self.outputStream
            outputStream.write(prettified)
        }
    }
}

extension Logger {
    public func with(prettier: Prettier) -> Logger {
        var logger = self
        logger.prettier = prettier
        return logger
    }

    public func with(outputStream: TextOutputStream) -> Logger {
        var logger = self
        logger.outputStream = outputStream
        return logger
    }

    public func withAppendingModifier(_ modifier: LogModifier) -> Logger {
        if let chain = self.modifier as? LogModifiersChain {
            chain.add(modifier)
            return self
        } else {
            let chain = LogModifiersChain(modifiers: [self.modifier])
            chain.add(modifier)

            var logger = self
            logger.modifier = chain
            return logger
        }
    }
}
