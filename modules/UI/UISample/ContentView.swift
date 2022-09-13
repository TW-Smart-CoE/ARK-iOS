//
//  ContentView.swift
//  UI
//
//  Copyright 2022 Thoughtworks, Inc. All rights reserved.
//

import SwiftUI
import UI

struct ContentView: View {
    var body: some View {
        VStack(spacing: .smallSpacing) {
            Text("Test ColorName with dynamic color")
                .padding(.bottom, .smallPadding)
                .foregroundColor(ColorName.blue.color)

            Text("Test ColorName with solid color")
                .padding(.bottom, .standardPadding)
                .foregroundColor(ColorName.teal200.color)

            Text("Test ThemeColors")
                .padding()
                .foregroundColor(ThemeColors.primary.color)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
