//
//  CustomFont.swift
//  UI
//
//  Copyright 2022 Thoughtworks, Inc. All rights reserved.
//

import Foundation
import SwiftUI

enum RegisterFontError: Error {
    case invalidFontFile
    case fontPathNotFound
    case initFontError
    case registerFailed
}

public extension Font {
    static var registerFonts: () -> Void = {
        FontWeight.allCases.map { $0.fontName() }.forEach { fontName in
            try? Font.register(fileName: fontName, type: ".ttf")
        }
        return {}
    }()

    internal static func register(fileName: String, type: String) throws {
        let frameworkBundle = Bundle.uiBundle
        guard let resourceBundleURL = frameworkBundle.path(forResource: fileName, ofType: type) else {
            throw RegisterFontError.fontPathNotFound
        }
        guard let fontData = NSData(contentsOfFile: resourceBundleURL),
        let dataProvider = CGDataProvider(data: fontData) else {
            throw RegisterFontError.invalidFontFile
        }
        guard let fontRef = CGFont(dataProvider) else {
            throw RegisterFontError.initFontError
        }
        var errorRef: Unmanaged<CFError>?
        guard CTFontManagerRegisterGraphicsFont(fontRef, &errorRef) else {
            throw RegisterFontError.registerFailed
        }
    }
}

extension StringProtocol {
    var firstUppercased: String { return prefix(1).uppercased() + dropFirst() }
}
