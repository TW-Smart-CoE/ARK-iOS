//
//  NetworkViewController.swift
//  Samples
//
//  Created by Renjun Li on 2022/11/24.
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
