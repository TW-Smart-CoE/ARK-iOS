//
//  NetworkViewModel.swift
//  Examples
//
//  Copyright 2022 Thoughtworks, Inc. All rights reserved.
//

import Foundation
import Core
import Alamofire

class NetworkViewModel: ObservableObject {
    enum Constants {
        static let baseURL = "https://httpbin.org"
        static let getPath = "/get"
        static let postPath = "/post"
        static let putPath = "/put"
        static let deletePath = "/delete"
    }
    enum UIState {
        case hideLoading
        case loading
        case error(String)
    }
    private let service: BaseURLService
    @Published var result: String = ""
    @Published var isLoading: Bool = false
    @Published var uiState: UIState = .hideLoading {
        didSet {
            switch uiState {
            case .loading:
                isLoading = true
            case .hideLoading:
                isLoading = false
            case .error(let messagee):
                isLoading = false
                result = messagee
            }
        }
    }
    
    deinit {
        Log.info(tag: "", message: "deinit")
    }
    
    init() {
        let apiService = APIService(session: .default)
        service = apiService.withBaseURL(Constants.baseURL)
    }
    
    func request(_ method: HTTPMethod) {
        uiState = .loading
        result = ""
        switch method {
        case .get:
            getRequest()
        case .post:
            postRequest()
        case .put:
            putRequest()
        case .delete:
            deleteRequest()
        default:
            break
        }
    }
    
    private func getRequest() {
        // optional: add interceptor
        var chain = RequestInterceptorsChain.default
        chain.add(LogInterceptor())
        let request = service.request(path: Constants.getPath, interceptor: chain)
        request.response(completionHandler: handleResponse(_:))
    }
    
    private func postRequest() {
        let request = service.request(path: Constants.postPath, method: .post)
        request.response(completionHandler: handleResponse(_:))
    }
    
    private func putRequest() {
        let request = service.request(path: Constants.putPath, method: .put)
        request.response(completionHandler: handleResponse(_:))
    }
    
    private func deleteRequest() {
        let request = service.request(path: Constants.deletePath, method: .delete)
        request.response(completionHandler: handleResponse(_:))
    }
    
    private func handleResponse(_ afResponse: AFDataResponse<Data?>) {
        switch afResponse.result {
        case .success(let data):
            guard let data = data else {
                uiState = .error("response data is nil")
                return
            }
            result = String(data: data, encoding: .utf8) ?? ""
            Log.info(tag: "Response", message: result)
            uiState = .hideLoading
        case .failure(let error):
            uiState = .error(error.localizedDescription)
        }
    }
}
