//
//  EnvironmentConfiguration.swift
//  Samples
//
//  Created by Renjun Li on 2022/11/24.
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
