//
//  Samples.swift
//  Samples
//
//  Copyright 2022 Thoughtworks, Inc. All rights reserved
//

import Foundation

public class Samples {
    public static func homePage() -> HomeNavigationController {
        let envvironment = Environment.development
        let dataSource = RemoteNetworkDataSource(service: envvironment.apiService)
        let repository = StandardNetworkRepository(dataSource: dataSource)
        let homeDependency = StandardHomeDependency(networkRepository: repository)
        let home = HomeNavigationController(dependency: homeDependency)
        let exampleViewModel = HomeViewModel(navigator: home)
        let homeVC = HomeViewController(viewModel: exampleViewModel)
        home.addChild(homeVC)
        return home
    }
}
