//
//  CodableExtension.swift
//  Samples
//
//  Created by Renjun Li on 2022/11/24.
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
