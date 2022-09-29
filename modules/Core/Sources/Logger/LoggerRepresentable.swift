//
//  Loggable.swift
//  Core
//
//  Copyright 2022 Thoughtworks, Inc. All rights reserved.
//

import Foundation

public enum LogLevel: String {
    case warning = "WARNING"
    case error = "ERROR"
    case info = "INFO"
}

enum Tags {
    static var JSONEncodingErrorTag: String = "JSON ENCDOING ERROR"
}

public protocol LoggerRepresentable {
    func log(_ record: any LogRecording)
}

extension LoggerRepresentable {
    public func log(
        level: String,
        tag: String,
        message: String,
        file: String,
        line: Int
    ) {
        let record = LogRecord(
            level: level,
            tag: tag,
            thread: Thread.current,
            date: Date(),
            file: file,
            line: line,
            message: message
        )
        log(record)
    }

    public func log<T: Encodable>(
        level: String,
        tag: String,
        encodable: T,
        file: String = #file,
        line: Int = #line
    ) {
        do {
            let jsonString = try json(from: encodable)
            log(level: level, tag: tag, message: jsonString, file: file, line: line)
        } catch let encodingError {
            error(tag: Tags.JSONEncodingErrorTag, error: encodingError)
        }
    }

    public func warning(
        tag: String,
        message: String,
        file: String = #file,
        line: Int = #line
    ) {
        log(level: LogLevel.warning.rawValue, tag: tag, message: message, file: file, line: line)
    }

    public func warning<T: Encodable>(
        tag: String,
        encodable: T,
        file: String = #file,
        line: Int = #line
    ) {
        do {
            let jsonString = try json(from: encodable)
            log(level: LogLevel.warning.rawValue, tag: tag, message: jsonString, file: file, line: line)
        } catch let encodingError {
            error(tag: Tags.JSONEncodingErrorTag, error: encodingError)
        }
    }

    public func error(
        tag: String,
        message: String,
        file: String = #file,
        line: Int = #line
    ) {
        log(level: LogLevel.error.rawValue, tag: tag, message: message, file: file, line: line)
    }

    public func error<T: Encodable>(
        tag: String,
        encodable: T,
        file: String = #file,
        line: Int = #line
    ) {
        do {
            let jsonString = try json(from: encodable)
            log(level: LogLevel.error.rawValue, tag: tag, message: jsonString, file: file, line: line)
        } catch let encodingError {
            error(tag: Tags.JSONEncodingErrorTag, error: encodingError)
        }
    }

    public func error(
        tag: String,
        error: Swift.Error,
        file: String = #file,
        line: Int = #line) {
        log(level: LogLevel.error.rawValue, tag: tag, message: "\(error)", file: file, line: line)
    }

    public func info(
        tag: String,
        message: String,
        file: String = #file,
        line: Int = #line
    ) {
        log(level: LogLevel.info.rawValue, tag: tag, message: message, file: file, line: line)
    }

    public func info<T: Encodable>(
        tag: String,
        encodable: T,
        file: String = #file,
        line: Int = #line
    ) {
        do {
            let jsonString = try json(from: encodable)
            log(level: LogLevel.info.rawValue, tag: tag, message: jsonString, file: file, line: line)
        } catch let encodingError {
            error(tag: Tags.JSONEncodingErrorTag, error: encodingError)
        }
    }

    func json<T: Encodable>(from encodable: T) throws -> String {
        let jsonData = try JSONEncoder().encode(encodable)
        return String(data: jsonData, encoding: .utf8) ?? "{ }"
    }
}
