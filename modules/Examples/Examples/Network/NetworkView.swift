//
//  NetworkView.swift
//  Examples
//
//  Created by Renjun Li on 2022/11/22.
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

struct NetworkResultView: View {
    @ObservedObject
    private var viewModel = NetworkViewModel()
    let method: HTTPMethod
    
    init(method: HTTPMethod) {
        self.method = method
    }
    
    var body: some View {
        VStack {
            Text(viewModel.result)
        }.onAppear(perform: {
            var viewModel = NetworkViewModel()
            viewModel.request(method)
        })
    }
}
