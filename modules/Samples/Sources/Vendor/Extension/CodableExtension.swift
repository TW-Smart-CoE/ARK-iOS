//
//  CodableExtension.swift
//  Samples
//
//  Copyright 2022 Thoughtworks, Inc. All rights reserved
//

import Foundation

extension Encodable {
    func toJSONString() -> String {
        let encoder = JSONEncoder()
        guard let data = try? encoder.encode(self) else {
            return ""
        }
        let string = String(data: data, encoding: .utf8)
        return string ?? ""
    }
}
