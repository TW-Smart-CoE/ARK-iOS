//
//  NetworkView.swift
//  Examples
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
                Text("response").foregroundColor(.red)
                Text(currentData.toJSONString())
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
