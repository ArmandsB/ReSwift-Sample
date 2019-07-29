//
//  APIClient.swift
//  CoreAPI
//
//  Created by Armands Baurovskis on 21/05/2019.
//  Copyright © 2019 iOSCoder All rights reserved.
//
import Alamofire
import Foundation

public typealias ResultCallback<Value> = (Swift.Result<Value, Error>) -> Void

public enum APIError: Error {
  case invalidResponse
  case invalidRequest
  case urlError(Error)
}

public protocol APIClient: class {
  
  var baseURL: URL { get }
  var sessionManager: SessionManager { get }
  var headers: HTTPHeaders { get }
  func send<T: APIRequest>(_ request: T, completion: @escaping ResultCallback<T.Response>) -> DataRequest?
  func validate(response: DataResponse<Any>) -> Error?
  func cancel()
}
