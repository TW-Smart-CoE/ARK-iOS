//
//  ExampleHomeViewController.swift
//  Samples
//
//  Created by Renjun Li on 2022/11/24.
//

import Foundation
import UIKit
import SwiftUI

class ExampleHomeViewController: UIHostingController<ExampleHomeView> {
    
    init() {
        super.init(rootView: ExampleHomeView())
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
    }
    
    
    required dynamic init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
