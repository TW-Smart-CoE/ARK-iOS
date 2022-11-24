//
//  HomeCoordinator.swift
//  Samples
//
//  Copyright 2022 Thoughtworks, Inc. All rights reserved
//

import Foundation
import UIKit

public protocol HomeDependency {
    var networkRepository: NetworkRepository { get }
}

public class HomeCoordinator: UINavigationController, HomeNavigator {
    private let dependency: HomeDependency
    
    public init(dependency: HomeDependency) {
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
