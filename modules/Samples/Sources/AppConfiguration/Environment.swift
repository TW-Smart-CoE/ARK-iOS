//
//  Environment.swift
//  Samples
//
//  Copyright 2022 Thoughtworks, Inc. All rights reserved
//

import Foundation
import Core
import Alamofire

class Environment {
    let apiService: BaseURLService
    
    init(apiService: BaseURLService) {
        self.apiService = apiService
    }
}

extension Environment {
    enum Constant {
        static let developmentBaseURL = "https://httpbin.org"
    }
    
    static var development: Environment {
        let apiService = APIService(session: .default)
        let baseURLService = apiService.withBaseURL(Constant.developmentBaseURL)
        return Environment(apiService: baseURLService)
    }
}
