//
//  ScaledFontModifier.swift
//  UI
//
//  Copyright 2022 Thoughtworks, Inc. All rights reserved.
//

import Foundation
import SwiftUI

struct ScaledFontModifier: ViewModifier {
    @Environment(\.sizeCategory) var sizeCategory
    var name: String
    var size: Double

    func body(content: Content) -> some View {
        let scaledSize = UIFontMetrics.default.scaledValue(for: size)
        return content.font(.custom(name, size: scaledSize))
    }
}

public extension View {
    func scaledFont(fontWeight: FontWeight, size: Double) -> some View {
        return self.modifier(ScaledFontModifier(name: fontWeight.fontName(), size: size))
    }
}
