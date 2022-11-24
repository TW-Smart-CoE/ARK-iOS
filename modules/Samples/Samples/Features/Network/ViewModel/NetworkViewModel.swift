//
//  NetworkViewModel.swift
//  Examples
//
//  Copyright 2022 Thoughtworks, Inc. All rights reserved.
//

import Foundation
import Combine
import Alamofire

class NetworkViewModel: ObservableObject {
    enum UIState {
        case hideLoading
        case loading
        case error
    }
    @Published var currentData: NetworkFeatureData?
    @Published var isLoading: Bool = false
    @Published var uiState: UIState = .hideLoading {
        didSet {
            switch uiState {
            case .loading:
                isLoading = true
            case .hideLoading:
                isLoading = false
            case .error:
                isLoading = false
            }
        }
    }
    let usecase: NetworkUseCase
    var bag: Set<AnyCancellable> = .init()
    
    init(repository: NetworkRepository) {
        usecase = NetworkUseCase(repository: repository)
    }
    
    func request(_ method: HTTPMethod) {
        uiState = .loading
        usecase.request(method)
            .sink(
                receiveCompletion: {[weak self] competion in
                    guard let self = self else { return }
                    switch competion {
                    case .failure:
                        self.uiState = .error
                    case .finished:
                        self.uiState = .hideLoading
                    }
                },
                receiveValue: {[weak self] value in
                    guard let self = self else { return }
                    self.uiState = .hideLoading
                    self.currentData = value
                }
            )
            .store(in: &bag)
    }
}
