//
//  NetworkViewModel.swift
//  Samples
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
        case error(Error)
    }
    @Published var currentData: NetworkFeatureData?
    @Published var isLoading: Bool = false
    @Published var errorMessage: String = ""
    @Published var uiState: UIState = .hideLoading {
        didSet {
            switch uiState {
            case .loading:
                isLoading = true
                errorMessage = ""
            case .hideLoading:
                isLoading = false
                errorMessage = ""
            case .error(let error):
                isLoading = false
                errorMessage = error.localizedDescription
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
                    case .failure(let error):
                        self.uiState = .error(error)
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
