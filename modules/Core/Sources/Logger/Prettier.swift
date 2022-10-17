//
//  Prettifing.swift
//  Core
//
//  Copyright 2022 Thoughtworks, Inc. All rights reserved.
//

import Foundation

public protocol Prettier {
    func prettify(_ record: any LogRecording) -> String
}

public struct DefaultPrettier: Prettier {
    static let UnkownFile = "Unkown File"
    static let UnkownThread = "Unkown Thread"

    public init() { }

    public func prettify(_ record: any LogRecording) -> String {
        let fileName = fileName(of: record.file)
        let threadName = record.thread.name ?? DefaultPrettier.UnkownThread
        return
"""
[\(record.level)][\(record.tag)][\(threadName)][\(record.date)][\(fileName):\(record.line)]
\(record.message)

"""
    }

    func fileName(of path: String) -> String {
        return path.split(separator: "/").last.map(String.init) ?? DefaultPrettier.UnkownFile
    }
}
