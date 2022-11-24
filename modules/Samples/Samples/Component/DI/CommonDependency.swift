//
//  CommonDependency.swift
//  Samples
//
//  Created by Renjun Li on 2022/11/24.
//

import Foundation


public protocol CommonDependency {
    var networkRepository: NetworkRepository { get }
}
