//
//  ImageName.swift
//  UI
//
//  Copyright 2022 Thoughtworks, Inc. All rights reserved.
//

import Foundation
import SwiftUI

public enum IconName: String {
    case commonBtnCollected = "common_btn_collected"
    case commonBtnUncollected = "common_btn_uncollected"
    case commonIconSetting = "common_icon_setting"
}

public extension Image {
    init(_ iconName: IconName) {
        self.init(iconName.rawValue, bundle: Bundle.uiBundle)
    }
}
