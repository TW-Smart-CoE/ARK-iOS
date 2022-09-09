//
//  ColorName.swift
//  UI
//
//  Copyright 2022 Thoughtworks, Inc. All rights reserved.
//

import Foundation
import SwiftUI

public enum ColorName: String {
    //black
    case black
    //white
    case white
    //gray
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
    //blue
    case blue
    //light blue
    case lightBlue50
    case lightBlue300
    //light green
    case lightGreen200
    case lightGreen700
    //purple
    case purple200
    case purple500
    case purple700
    //teal
    case teal200
    case teal700
    //red
    case red700
    case red900
}

public extension ColorName {
    var color: Color {
        Color(self.rawValue)
    }
}

extension Color {
    init(_ colorName: ColorName, bundle: Bundle = Bundle.uiBundle) {
        self.init(colorName.rawValue, bundle: bundle)
    }
}
