//
//  ExampleHomeView.swift
//  Examples
//
//  Copyright 2022 Thoughtworks, Inc. All rights reserved.
//

import SwiftUI

public struct ExampleHomeView: View {
    public init() { }
    
    public var body: some View {
        NavigationView {
            List {
                NavigationLink {
                    NetworkView()
                } label: {
                    Text("Network Sample")
                }
            }
            .navigationTitle("Ark Example List")
            .navigationBarTitleDisplayMode(.inline)
        }
        .navigationViewStyle(StackNavigationViewStyle())
    }
}
