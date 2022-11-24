//
//  HomeCoordinator.swift
//  Samples
//
//  Created by Renjun Li on 2022/11/24.
//

import Foundation
import UIKit

protocol HomeDependency {
    var networkRepository: NetworkRepository { get }
}

class HomeCoordinator: UINavigationController, HomeNavigator {
    private let dependency: HomeDependency
    
    init(dependency: HomeDependency) {
        self.dependency = dependency
        super.init(nibName: nil, bundle: nil)
    }
    
    func navigateToNetwork() {
        let viewModel = NetworkViewModel(repository: dependency.networkRepository)
        let networkVC = NetworkViewController(viewModel: viewModel)
        pushViewController(networkVC, animated: true)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
