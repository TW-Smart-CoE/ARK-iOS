//
//  DeveloperTools.swift
//  ARK-iOS
//
//  Copyright 2022 Thoughtworks, Inc. All rights reserved.
//

import SwiftUI

struct DeveloperTools: View {
    var body: some View {
        Text(BuildEnvironment.current.bundleIdentifier)
    }
}

extension DeveloperTools {
    static let ShortcutActionType = "DeveloperAction"
}

struct DeveloperTools_Previews: PreviewProvider {
    static var previews: some View {
        DeveloperTools()
    }
}
