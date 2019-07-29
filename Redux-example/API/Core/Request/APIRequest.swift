//
//  APIRequest.swift
//  CoreAPI
//
//  Created by Armands Baurovskis on 21/05/2019.
//  Copyright © 2019 iOSCoder All rights reserved.
//
import Alamofire
import Foundation

public protocol APIRequest {
  associatedtype Response: Decodable
  
  var method: HTTPMethod { get }
  var endpoint: String { get }
  var headers: HTTPHeaders? { get }
  var parameters: Parameters? { get }
  var encoding: ParameterEncoding { get }
}
