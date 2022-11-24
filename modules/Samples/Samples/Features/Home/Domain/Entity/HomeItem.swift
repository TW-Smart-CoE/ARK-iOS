//
//  HomeItem.swift
//  Samples
//
//  Created by Renjun Li on 2022/11/24.
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
