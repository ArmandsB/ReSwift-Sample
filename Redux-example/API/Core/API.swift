//
//  API.swift
//  Redux-example
//
//  Created by Armands Baurovskis on 29/07/2019.
//  Copyright © 2019 iOSCoder. All rights reserved.
//

import Foundation
import Alamofire

class API: APIClient {
    let baseURL: URL
    lazy var sessionManager: SessionManager = {
        let configuration = URLSessionConfiguration.default
        configuration.httpAdditionalHeaders = SessionManager.defaultHTTPHeaders
        return SessionManager(configuration: configuration)
    }()

    let headers: HTTPHeaders = [:]

    init() {
        self.baseURL = URL(string: "https://jsonplaceholder.typicode.com")!
    }

    func validate(response: DataResponse<Any>) -> Error? {
        if let error = response.error {
            return APIError.urlError(error)
        }

        return nil
    }
}
