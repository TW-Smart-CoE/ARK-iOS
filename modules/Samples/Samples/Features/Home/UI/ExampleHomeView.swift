//
//  ExampleHomeView.swift
//  Examples
//
//  Copyright 2022 Thoughtworks, Inc. All rights reserved.
//

import SwiftUI

struct ExampleHomeView: View {
    @ObservedObject var viewModel: ExampleHomeViewModel
    
    init(viewModel: ExampleHomeViewModel) {
        self.viewModel = viewModel
    }
    
    public var body: some View {
        VStack {
            List {
                ForEach(viewModel.itemList) { item in
                    Button(item.title) {
                        viewModel.navigate(to: item.itemType)
                    }
                }
            }
        }
    }
}
