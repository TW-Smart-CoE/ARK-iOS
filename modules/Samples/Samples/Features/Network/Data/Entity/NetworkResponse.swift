//
//  NetworkResponse.swift
//  Samples
//
//  Created by Renjun Li on 2022/11/23.
//

import Foundation

struct NetworkResponse: Codable {
    let origin: String
    let url: String
    let header: NetworkResponseHeader
    
    init(origin: String, url: String, header: NetworkResponseHeader) {
        self.origin = origin
        self.url = url
        self.header = header
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.origin = (try? container.decode(String.self, forKey: .origin)) ?? ""
        self.url = (try? container.decode(String.self, forKey: .url)) ?? ""
        self.header = (try? container.decode(NetworkResponseHeader.self, forKey: .header)) ?? .default
    }
    
    enum CodingKeys: String, CodingKey {
        case origin
        case url
        case header
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(self.origin, forKey: .origin)
        try container.encode(self.url, forKey: .url)
    }
}

struct NetworkResponseHeader: Codable {
    let accept: String
    let acceptEncoding: String
    let acceptLanguage: String
    let host: String
    let userAgent: String
    
    enum CodingKeys: String, CodingKey {
        case accept = "Accept"
        case acceptEncoding = "Accept-Encoding"
        case acceptLanguage = "Accept-Language"
        case host = "Host"
        case userAgent = "User-Agent"
    }
    
    internal init(
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
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.accept = (try? container.decode(String.self, forKey: .accept)) ?? ""
        self.acceptEncoding = (try? container.decode(String.self, forKey: .acceptEncoding)) ?? ""
        self.acceptLanguage = (try? container.decode(String.self, forKey: .acceptLanguage)) ?? ""
        self.host = (try? container.decode(String.self, forKey: .host)) ?? ""
        self.userAgent = (try? container.decode(String.self, forKey: .userAgent)) ?? ""
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(self.accept, forKey: .accept)
        try container.encode(self.acceptEncoding, forKey: .acceptEncoding)
        try container.encode(self.acceptLanguage, forKey: .acceptLanguage)
        try container.encode(self.host, forKey: .host)
        try container.encode(self.userAgent, forKey: .userAgent)
    }
}

extension NetworkResponseHeader {
    static let `default`: NetworkResponseHeader = .init(
        accept: "",
        acceptEncoding: "",
        acceptLanguage: "",
        host: "",
        userAgent: ""
    )
}
