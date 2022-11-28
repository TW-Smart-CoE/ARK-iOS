//
//  HomeView.swift
//  Samples
//
//  Copyright 2022 Thoughtworks, Inc. All rights reserved.
//

import SwiftUI
import UI

public struct HomeView: View {
    @ObservedObject var viewModel: HomeViewModel
    
    public init(viewModel: HomeViewModel) {
        self.viewModel = viewModel
    }
    
    public var body: some View {
        VStack {
            List {
                ForEach(viewModel.itemList) { item in
                    HomeRow(title: item.title) {
                        viewModel.navigate(to: item.itemType)
                    }
                }
            }
            .navigationTitle("Samples")
            .background(ThemeColors.background.color)
        }
    }
}

private struct HomeRow: View {
    private let onTap: (() -> Void)
    private let title: String
    
    init(title: String, onTap: @escaping (() -> Void)) {
        self.title = title
        self.onTap = onTap
    }
    
    var body: some View {
        Text(title)
            .foregroundColor(ThemeColors.primary.color)
            .onTapGesture {
                self.onTap()
            }
            .listRowBackground(ThemeColors.surface.color)
    }
}
