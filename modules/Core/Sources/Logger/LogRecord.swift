//
//  LogRecord.swift
//  Core
//
//  Copyright 2022 Thoughtworks, Inc. All rights reserved.
//

import Foundation

public struct LogRecord {
    let level: String
    let tag: String
    let thread: Thread
    let date: Date
    let file: String
    let line: Int
    var message: String
}
