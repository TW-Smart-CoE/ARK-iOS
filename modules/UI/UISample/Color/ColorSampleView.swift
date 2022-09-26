//
//  ColorSampleView.swift
//  UI
//
//  Copyright 2022 Thoughtworks, Inc. All rights reserved.
//

import SwiftUI
import UI

struct ColorSampleView: View {
    var body: some View {
        VStack {
            Text("Test ColorName with dynamic color")
                .foregroundColor(Colors.blue.color)

            Text("Test ColorName with solid color")
                .foregroundColor(Colors.teal200.color)

            Text("Test ThemeColors")
                .foregroundColor(ThemeColors.primary.color)
        }
    }
}

struct ColorSampleView_Previews: PreviewProvider {
    static var previews: some View {
        ColorSampleView()
    }
}
