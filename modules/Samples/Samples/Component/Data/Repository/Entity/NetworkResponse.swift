//
//  NetworkResponse.swift
//  Samples
//
//  Copyright 2022 Thoughtworks, Inc. All rights reserved
//

import Foundation

public struct NetworkResponse: Codable {
    public let origin: String
    public let url: String
    public let header: NetworkResponseHeader?
    
    public init(origin: String, url: String, header: NetworkResponseHeader) {
        self.origin = origin
        self.url = url
        self.header = header
    }
    
    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.origin = (try container.decode(String.self, forKey: .origin))
        self.url = (try container.decode(String.self, forKey: .url))
        self.header = try? container.decode(NetworkResponseHeader.self, forKey: .header)
    }
    
    public enum CodingKeys: String, CodingKey {
        case origin
        case url
        case header
    }
    
    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(self.origin, forKey: .origin)
        try container.encode(self.url, forKey: .url)
    }
}

public struct NetworkResponseHeader: Codable {
    public let accept: String
    public let acceptEncoding: String
    public let acceptLanguage: String
    public let host: String
    public let userAgent: String
    
    enum CodingKeys: String, CodingKey {
        case accept = "Accept"
        case acceptEncoding = "Accept-Encoding"
        case acceptLanguage = "Accept-Language"
        case host = "Host"
        case userAgent = "User-Agent"
    }
    
    public init(
        accept: String,
        acceptEncoding: String,
        acceptLanguage: String,
        host: String,
        userAgent: String
    ) {
        self.accept = accept
        self.acceptEncoding = acceptEncoding
        self.acceptLanguage = acceptLanguage
        self.host = host
        self.userAgent = userAgent
    }
    
    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.accept = try container.decode(String.self, forKey: .accept)
        self.acceptEncoding = try container.decode(String.self, forKey: .acceptEncoding)
        self.acceptLanguage = try container.decode(String.self, forKey: .acceptLanguage)
        self.host = try container.decode(String.self, forKey: .host)
        self.userAgent = try container.decode(String.self, forKey: .userAgent)
    }
    
    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(self.accept, forKey: .accept)
        try container.encode(self.acceptEncoding, forKey: .acceptEncoding)
        try container.encode(self.acceptLanguage, forKey: .acceptLanguage)
        try container.encode(self.host, forKey: .host)
        try container.encode(self.userAgent, forKey: .userAgent)
    }
}

public extension NetworkResponseHeader {
    static let `default`: NetworkResponseHeader = .init(
        accept: "",
        acceptEncoding: "",
        acceptLanguage: "",
        host: "",
        userAgent: ""
    )
}
