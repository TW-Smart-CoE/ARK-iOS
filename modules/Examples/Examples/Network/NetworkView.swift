//
//  NetworkView.swift
//  Examples
//
//  Copyright 2022 Thoughtworks, Inc. All rights reserved.
//

import SwiftUI
import Alamofire

struct NetworkView: View {
    @StateObject
    private var viewModel = NetworkViewModel()
    
    var body: some View {
        List {
            if !viewModel.result.isEmpty {
                Text(viewModel.result)
            }
            if viewModel.isLoading {
                ProgressView()
            }
            Button("GET") {
                viewModel.request(.get)
            }
            Button("POST") {
                viewModel.request(.post)
            }
            Button("Delete") {
                viewModel.request(.delete)
            }
            Button("PUT") {
                viewModel.request(.put)
            }
        }
        .navigationViewStyle(StackNavigationViewStyle())
    }
}
