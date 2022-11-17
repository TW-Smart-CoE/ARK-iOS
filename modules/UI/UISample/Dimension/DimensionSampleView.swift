//
//  DemensionSampleView.swift
//  UI
//
//  Copyright 2022 Thoughtworks, Inc. All rights reserved.
//

import SwiftUI
import UI

struct DimensionSampleView: View {
    var body: some View {
        VStack(spacing: .smallSpacing) {
            Text("Test ColorName with dynamic color")
                .padding(.bottom, .smallPadding)
                .foregroundColor(ColorPalette.blue.color)

            Text("Test ColorName with solid color")
                .padding(.bottom, .standardPadding)
                .foregroundColor(ColorPalette.teal200.color)

            Text("Test ThemeColors")
                .padding()
                .foregroundColor(Colors.primary.color)
        }
    }
}

struct DemensionSampleView_Previews: PreviewProvider {
    static var previews: some View {
        DimensionSampleView()
    }
}
