//
//  ColorName.swift
//  UI
//
//  Copyright 2022 Thoughtworks, Inc. All rights reserved.
//

import Foundation
import SwiftUI

public enum ColorName: String {
    case gray50
    case gray100
    case gray200
    case gray300
    case gray400
    case gray500
    case gray600
    case gray700
    case gray800
    case gray900
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


