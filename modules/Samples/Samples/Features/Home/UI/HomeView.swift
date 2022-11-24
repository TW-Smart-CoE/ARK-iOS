//
//  ExampleHomeView.swift
//  Examples
//
//  Copyright 2022 Thoughtworks, Inc. All rights reserved.
//

import SwiftUI

struct HomeView: View {
    @ObservedObject var viewModel: HomeViewModel
    
    init(viewModel: HomeViewModel) {
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