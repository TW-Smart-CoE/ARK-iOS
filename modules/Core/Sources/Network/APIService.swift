//
//  APIService.swift
//  Core
//
//  Copyright 2022 Thoughtworks, Inc. All rights reserved.
//

import Alamofire
import Combine
import UIKit

public class APIService {
    static let `default` = APIService(session: .default)

    public let session: Alamofire.Session

    public convenience init(session: Alamofire.Session) {
        self.init(
            session: session.session,
            delegate: session.delegate,
            rootQueue: session.rootQueue,
            startRequestsImmediately: session.startRequestsImmediately,
            requestQueue: session.requestQueue,
            serializationQueue: session.serializationQueue,
            interceptor: session.interceptor,
            serverTrustManager: session.serverTrustManager,
            redirectHandler: session.redirectHandler,
            cachedResponseHandler: session.cachedResponseHandler,
            eventMonitors: [session.eventMonitor]
        )
    }

    public init(
        session: URLSession,
        delegate: SessionDelegate,
        rootQueue: DispatchQueue,
        startRequestsImmediately: Bool = true,
        requestQueue: DispatchQueue? = nil,
        serializationQueue: DispatchQueue? = nil,
        interceptor: RequestInterceptor? = nil,
        serverTrustManager: ServerTrustManager? = nil,
        redirectHandler: RedirectHandler? = nil,
        cachedResponseHandler: CachedResponseHandler? = nil,
        eventMonitors: [EventMonitor] = []) {
            var chain: RequestInterceptorsChain {
                if let `interceptor` = interceptor {
                    var chain = RequestInterceptorsChain.default
                    chain.add(interceptor)
                    return chain
                } else {
                    return RequestInterceptorsChain.default
                }
            }

            let afSession = Alamofire.Session(
            session: session,
            delegate: delegate,
            rootQueue: rootQueue,
            startRequestsImmediately: startRequestsImmediately,
            requestQueue: requestQueue,
            serializationQueue: serializationQueue,
            interceptor: chain,
            serverTrustManager: serverTrustManager,
            redirectHandler: redirectHandler,
            cachedResponseHandler: cachedResponseHandler,
            eventMonitors: eventMonitors
        )
            self.session = afSession
    }
}

public struct BaseURLService {
    let serivce: APIService
    let baseURL: String
}

extension BaseURLService {
    public func request(
        path: String,
        method: HTTPMethod = .get,
        parameters: Parameters? = nil,
        encoding: ParameterEncoding = URLEncoding.default,
        headers: HTTPHeaders? = nil,
        interceptor: RequestInterceptor? = nil,
        requestModifier: Alamofire.Session.RequestModifier? = nil
    ) -> Alamofire.DataRequest {
        let urlString: URLConvertible = baseURL + path
        return self.serivce.session.request(
            urlString,
            method: method,
            parameters: parameters,
            encoding: encoding,
            headers: headers,
            interceptor: interceptor,
            requestModifier: requestModifier
        )
    }
}

extension APIService {
    public func withBaseURL(_ baseURL: String) -> BaseURLService {
        return BaseURLService(serivce: self, baseURL: baseURL)
    }
}
