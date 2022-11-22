//
//  LogInterceptor.swift
//  Examples
//
//  Created by Renjun Li on 2022/11/22.
//

import Core
import Alamofire

class LogInterceptor: RequestInterceptor {
    func adapt(
        _ urlRequest: URLRequest,
        for session: Session,
        completion: @escaping (Result<URLRequest, Error>) -> Void
    ) {
        let header = urlRequest.headers
        let method = urlRequest.method?.rawValue ?? ""
        let url = urlRequest.url
        var body = ""
        if let bodyData = urlRequest.httpBody {
            body = String(data: bodyData, encoding: .utf8) ?? ""
        }
        Log.info(tag: "Network", message: "url:\(url?.absoluteString ?? "")")
        Log.info(tag: "Network", message: "header:\(header)")
        Log.info(tag: "Network", message: "method: \(method)")
        Log.info(tag: "Network", message: "body: \(body)")
        completion(.success(urlRequest))
    }
}
