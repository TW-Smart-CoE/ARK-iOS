//
//  NetworkView.swift
//  Samples
//
//  Copyright 2022 Thoughtworks, Inc. All rights reserved.
//

import SwiftUI
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
                Text("response").foregroundColor(.blue)
                Text(currentData.toJSONString())
            } else if !viewModel.errorMessage.isEmpty {
                Text(viewModel.errorMessage).foregroundColor(.red)
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
        .overlay(
            ProgressView()
                .opacity(viewModel.isLoading ? 1: 0)
        )
    }
}
