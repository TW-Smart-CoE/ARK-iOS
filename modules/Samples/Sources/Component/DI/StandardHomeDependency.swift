//
//  StandardHomeDependency.swift
//  Samples
//
//  Copyright 2022 Thoughtworks, Inc. All rights reserved
//

import Foundation
import Core
import Network

class StandardHomeDependency: CommonDependency {
    let networkRepository: NetworkRepository
    
    init(networkRepository: NetworkRepository) {
        self.networkRepository = networkRepository
    }
}
