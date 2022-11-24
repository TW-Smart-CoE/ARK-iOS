//
//  HomeCoordinator.swift
//  Samples
//
//  Copyright 2022 Thoughtworks, Inc. All rights reserved
//

import Foundation
import UIKit

public class HomeCoordinator: UINavigationController, HomeNavigator {
    private let dependency: CommonDependency
    
    public init(dependency: CommonDependency) {
        self.dependency = dependency
        super.init(nibName: nil, bundle: nil)
    }
    
    public func navigateToNetwork() {
        let viewModel = NetworkViewModel(repository: dependency.networkRepository)
        let networkVC = NetworkViewController(viewModel: viewModel)
        pushViewController(networkVC, animated: true)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
