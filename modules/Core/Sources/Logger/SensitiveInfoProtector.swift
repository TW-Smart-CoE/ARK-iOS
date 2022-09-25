//
//  SensitiveInfoProtector.swift
//  Core
//
//  Copyright 2022 Thoughtworks, Inc. All rights reserved.
//

import Foundation

public struct SensitiveInfoProtector: LogModifier {
    public func modify(_ record: LogRecord) -> LogRecord? {
#if DEBUG
return record
#else
var result = record
result.message = "*****"
return result
#endif
    }
}
