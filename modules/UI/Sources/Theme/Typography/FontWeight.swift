//
//  FontWeight.swift
//  UI
//
//  Copyright 2022 Thoughtworks, Inc. All rights reserved.
//

import Foundation

public enum FontWeight: String, CaseIterable {
    case medium
    case light
    case regular
    case mediumItalic
    case thinItalic
    case boldItalic
    case lightLtalic
    case ttalic
    case blackItalic
    case bold
    case thin
    case black
}

extension FontWeight {
    func fontName() -> String {
        return "Roboto-\(rawValue.firstUppercased)"
    }
}
