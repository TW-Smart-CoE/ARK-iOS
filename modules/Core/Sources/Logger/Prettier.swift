//
//  Prettifing.swift
//  Core
//
//  Copyright 2022 Thoughtworks, Inc. All rights reserved.
//

import Foundation

public protocol Prettier {
    func prettify(_ record: LogRecord) -> String
}

public struct DefaultPrettier: Prettier {
    static let UnkownFile = "Unkown File"

    public init() { }

    public func prettify(_ record: LogRecord) -> String {
        let fileName = fileName(of: record.file)
        return
"""
[\(record.level)][\(record.tag)][\(record.thread.name ?? "Unkown thread")][\(record.date)][\(fileName):\(record.line)]
\(record.message)
"""
    }

    func fileName(of path: String) -> String {
        return path.split(separator: "/").last.map(String.init) ?? DefaultPrettier.UnkownFile
    }
}
