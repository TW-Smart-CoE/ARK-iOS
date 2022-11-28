//
//  NetworkItem.swift
//  Samples
//
//  Copyright 2022 Thoughtworks, Inc. All rights reserved
//

import Foundation
import Alamofire

enum NetworkItemType: String {
    case get
    case post
    case put
    case delete
    
    var httpMethod: HTTPMethod {
        switch self {
        case .get:
            return .get
        case .post:
            return .post
        case .put:
            return .put
        case .delete:
            return .delete
        }
    }
}

struct NetworkItem: Identifiable {
    var id: String {
        return itemType.rawValue
    }
    let title: String
    let itemType: NetworkItemType
    
    init(itemType: NetworkItemType) {
        self.title = itemType.rawValue
        self.itemType = itemType
    }
}
