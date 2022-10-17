//
//  SensitiveInfoProtector.swift
//  Core
//
//  Copyright 2022 Thoughtworks, Inc. All rights reserved.
//

import Foundation

public struct SensitiveInfoProtector: LogModifier {
    public func modify(_ record: any LogRecording) -> (any LogRecording)? {
#if DEBUG
return record
#else
return LogRecord(
    level: record.level,
    tag: record.tag,
    thread: record.thread,
    date: record.date,
    file: record.file,
    line: record.line,
    message: "*****"
)
#endif
    }
}
