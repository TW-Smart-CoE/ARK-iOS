//
//  Samples.swift
//  Samples
//
//  Copyright 2022 Thoughtworks, Inc. All rights reserved
//

import Foundation

public class Samples {
    public static func homePage() -> HomeCoordinator {
        let envvironment = EnvironmentConfiguration.development
        let repository = StandardNetworkRepository(service: envvironment.apiService)
        let homeDependency = StandardHomeDependency(networkRepository: repository)
        let home = HomeCoordinator(dependency: homeDependency)
        let exampleViewModel = HomeViewModel(navigator: home)
        let homeVC = HomeViewController(viewModel: exampleViewModel)
        home.addChild(homeVC)
        return home
    }
}