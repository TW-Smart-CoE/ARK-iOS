//
//  HomeItem.swift
//  Samples
//
//  Copyright 2022 Thoughtworks, Inc. All rights reserved
//

import Foundation

enum HomeItemType: String {
    case network
}

struct HomeItem: Identifiable {
    var id: String {
        return itemType.rawValue
    }
    let title: String
    let itemType: HomeItemType
}
