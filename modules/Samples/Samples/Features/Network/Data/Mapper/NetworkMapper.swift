//
//  NetworkMapper.swift
//  Samples
//
//  Copyright 2022 Thoughtworks, Inc. All rights reserved
//

struct NetworkMapper {
    static func transform(_ serverData: NetworkResponse) -> NetworkFeatureData {
        return .init(
            accept: serverData.header.accept,
            acceptEncoding: serverData.header.acceptEncoding,
            acceptLanguage: serverData.header.acceptLanguage,
            host: serverData.header.host,
            userAgent: serverData.header.userAgent,
            origin: serverData.origin,
            url: serverData.url
        )
    }
}
