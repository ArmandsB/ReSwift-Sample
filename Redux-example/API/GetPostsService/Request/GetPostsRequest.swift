//
//  GetPostsRequest.swift
//  Redux-example
//
//  Created by Armands Baurovskis on 29/07/2019.
//  Copyright © 2019 iOSCoder. All rights reserved.
//

import Alamofire
import Foundation

struct GetPostsRequest: APIRequest {
    typealias Response = GetPostsResponse
    let method: HTTPMethod
    let endpoint: String
    let headers: HTTPHeaders?
    let parameters: Parameters?
    let encoding: ParameterEncoding

    init() {
        self.method = .get
        self.endpoint = "/posts"
        self.headers = nil
        self.parameters = nil
        self.encoding = JSONEncoding.default
    }
}
