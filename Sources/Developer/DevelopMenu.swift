//
//  DeveloperTools.swift
//  ARK-iOS
//
//  Copyright 2022 Thoughtworks, Inc. All rights reserved.
//

import SwiftUI

struct DevelopMenu: View {
    var body: some View {
        Text(BuildEnvironment.current.bundleIdentifier)
    }
}

extension DevelopMenu {
    static let ShortcutType = "DevelopMenu"
    static let ShortcutName = "Develop Menu"
}

struct DeveloperTools_Previews: PreviewProvider {
    static var previews: some View {
        DevelopMenu()
    }
}
