//
//  StandardHomeDependency.swift
//  Samples
//
//  Created by Renjun Li on 2022/11/24.
//

import Foundation
import Core
import Network

class StandardHomeDependency: HomeDependency {
    
    let networkRepository: NetworkRepository
    
    init(networkRepository: NetworkRepository) {
        self.networkRepository = networkRepository
    }
}
