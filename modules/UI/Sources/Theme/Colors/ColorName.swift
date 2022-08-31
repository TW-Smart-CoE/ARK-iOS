//
//  ColorName.swift
//  UI
//
//  Copyright 2022 Thoughtworks, Inc. All rights reserved.
//

import Foundation
import SwiftUI

public enum ColorName: String {
    case gray_50
    case gray_100
    case gray_200
    case gray_300
    case gray_400
    case gray_500
    case gray_600
    case gray_700
    case gray_800
    case gray_900
    case blue
}

public extension ColorName {
    var color: Color {
        Color(self)
    }
}

extension Color {
    init(_ colorName: ColorName, bundle: Bundle = Bundle.uiBundle) {
        self.init(colorName.rawValue, bundle: bundle)
    }
}


