//
//  NetworkFeatureData.swift
//  Samples
//
//  Copyright 2022 Thoughtworks, Inc. All rights reserved
//

import Foundation

public struct NetworkFeatureData: Codable {
    public let accept: String
    public let acceptEncoding: String
    public let acceptLanguage: String
    public let host: String
    public let userAgent: String
    public let origin: String
    public let url: String
}
