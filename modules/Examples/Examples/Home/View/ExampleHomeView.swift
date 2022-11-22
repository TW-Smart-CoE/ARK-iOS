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
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundColor(.accentColor)
            Text("Hello, ExampleHomeView!")
        }
        .padding()
    }
}
