//
//  Session.swift
//  Core
//
//  Copyright 2022 Thoughtworks, Inc. All rights reserved.
//

import Combine
import Alamofire

public protocol Session {
    associatedtype Request
    associatedtype Response

    typealias RequestCompletion = (Result<Request, Error>) -> Void
    typealias ResponseCompletion = (Result<Response, Error>) -> Void

    func resume(_ request: Request, response: @escaping ResponseCompletion)

    func intercept(_ request: Request, completion: @escaping RequestCompletion)
    func intercept(_ response: Response, completion: @escaping ResponseCompletion)
}

extension Session {
    public func intercept(_ request: Request, completion: @escaping (Result<Request, Error>) -> Void) {
        completion(Result.success(request))
    }

    public func intercept(_ response: Response, completion: @escaping (Result<Response, Error>) -> Void) {
        completion(Result.success(response))
    }

    public func resumeWithInterceptor(_ request: Request, response: @escaping (Result<Response, Error>) -> Void) {
        let interceptedResponse: ResponseCompletion = { resp in
            switch resp {
            case .success(let unwrapped): intercept(unwrapped, completion: response)
            case .failure(let error): response(Result.failure(error))
            }
        }

        let requestData: RequestCompletion = { req in
            switch req {
            case .success(let unwrapped): resume(unwrapped, response: interceptedResponse)
            case .failure(let error): response(Result.failure(error))
            }
        }

        intercept(request, completion: requestData)
    }
}
