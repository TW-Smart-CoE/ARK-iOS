//
//  HomeViewController.swift
//  Samples
//
//  Copyright 2022 Thoughtworks, Inc. All rights reserved
//

import Foundation
import UIKit
import SwiftUI
import UI

public class HomeViewController: UIHostingController<HomeView> {
    private let viewModel: HomeViewModel
    
    init(viewModel: HomeViewModel) {
        self.viewModel = viewModel
        let view = HomeView(viewModel: viewModel)
        super.init(rootView: view)
    }
    
    public override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    required dynamic init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
