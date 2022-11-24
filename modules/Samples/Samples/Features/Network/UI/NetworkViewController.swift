//
//  NetworkViewController.swift
//  Samples
//
//  Copyright 2022 Thoughtworks, Inc. All rights reserved
//

import UIKit
import SwiftUI

class NetworkViewController: UIHostingController<NetworkView> {
    init(viewModel: NetworkViewModel) {
        let networkView = NetworkView(viewModel: viewModel)
        super.init(rootView: networkView)
    }
    
    required dynamic init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
