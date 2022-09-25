//
//  DefaultOutputStream.swift
//  Core
//
//  Copyright 2022 Thoughtworks, Inc. All rights reserved.
//

import Foundation

struct DefaultOutputStream: TextOutputStream {
    mutating func write(_ string: String) {
        // swiftlint:disable prevent_print
        print(string)
        // swiftlint:enable prevent_print
    }
}
