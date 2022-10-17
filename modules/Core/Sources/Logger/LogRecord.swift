//
//  LogRecord.swift
//  Core
//
//  Copyright 2022 Thoughtworks, Inc. All rights reserved.
//

import Foundation

public protocol LogRecording {
    var level: String { get }
    var tag: String { get }
    var thread: Thread { get }
    var date: Date { get }
    var file: String { get }
    var line: Int { get }
    var message: String { get }
}

public struct LogRecord: LogRecording {
    public let level: String
    public let tag: String
    public let thread: Thread
    public let date: Date
    public let file: String
    public let line: Int
    public var message: String
}
