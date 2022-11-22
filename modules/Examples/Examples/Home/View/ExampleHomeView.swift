//
//  ExampleHomeView.swift
//  Examples
//
//  Created by Renjun Li on 2022/11/22.
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
