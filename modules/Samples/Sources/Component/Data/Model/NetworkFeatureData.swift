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
    
    public init(
        accept: String,
        acceptEncoding: String,
        acceptLanguage: String,
        host: String,
        userAgent: String,
        origin: String,
        url: String
    ) {
        self.accept = accept
        self.acceptEncoding = acceptEncoding
        self.acceptLanguage = acceptLanguage
        self.host = host
        self.userAgent = userAgent
        self.origin = origin
        self.url = url
    }
}
