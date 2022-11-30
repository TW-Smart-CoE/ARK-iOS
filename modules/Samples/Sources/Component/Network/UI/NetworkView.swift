//
//  NetworkView.swift
//  Samples
//
//  Copyright 2022 Thoughtworks, Inc. All rights reserved.
//

import SwiftUI
import UI
import Alamofire

struct NetworkView: View {
    @ObservedObject
    private var viewModel: NetworkViewModel
    
    init(viewModel: NetworkViewModel) {
        self.viewModel = viewModel
    }
    
    var body: some View {
        List {
            if let currentData = viewModel.currentData {
                Text("response")
                    .listRowBackground(ThemeColors.surface.color)
                    .foregroundColor(ThemeColors.primary.color)
                Text(currentData.toJSONString())
                    .listRowBackground(ThemeColors.surface.color)
                    .foregroundColor(ThemeColors.primary.color)
            } else if !viewModel.errorMessage.isEmpty {
                Text(viewModel.errorMessage)
                    .foregroundColor(ThemeColors.error.color)
                    .listRowBackground(ThemeColors.surface.color)
            }
            ForEach(viewModel.items) { item in
                NetworkRow(title: item.title) {
                    viewModel.request(item.itemType)
                }
                .listRowBackground(ThemeColors.surface.color)
            }
        }
        .navigationTitle("Network")
        .background(ThemeColors.background.color)
        .overlay(
            ProgressView()
                .opacity(viewModel.isLoading ? 1: 0)
        )
    }
}

private struct NetworkRow: View {
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
    }
}
