//
//  EnvironmentConfiguration.swift
//  Samples
//
//  Copyright 2022 Thoughtworks, Inc. All rights reserved
//

import Foundation
import Core
import Alamofire

class EnvironmentConfiguration {
    let apiService: BaseURLService
    
    init(apiService: BaseURLService) {
        self.apiService = apiService
    }
}

extension EnvironmentConfiguration {
    enum Constant {
        static let developmentBaseURL = "https://httpbin.org"
    }
    
    static var development: EnvironmentConfiguration {
        let apiService = APIService(session: .default)
        let baseURLService = apiService.withBaseURL(Constant.developmentBaseURL)
        return EnvironmentConfiguration(apiService: baseURLService)
    }
}
