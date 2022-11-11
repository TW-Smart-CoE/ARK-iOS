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
        NavigationView {
            List {
                NavigationLink {
                    ColorSampleView()
                } label: {
                    Text("Color Sample")
                }

                NavigationLink {
                    DimensionSampleView()
                } label: {
                    Text("Dimension Sample")
                }

                NavigationLink {
                    TypographySampleView()
                } label: {
                    Text("Typography Sample")
                }

                NavigationLink {
                    IconSampleView()
                } label: {
                    Text("Icon Sample")
                }
            }
            .navigationTitle("Sample List")
            .navigationBarTitleDisplayMode(.inline)
        }
        .navigationViewStyle(StackNavigationViewStyle())
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
