//
//  CommonDependency.swift
//  Samples
//
//  Copyright 2022 Thoughtworks, Inc. All rights reserved
//

import Foundation

public protocol CommonDependency {
    var networkRepository: NetworkRepository { get }
}
