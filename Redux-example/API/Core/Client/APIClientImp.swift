//
//  APIClientImp.swift
//  CoreAPI
//
//  Created by Armands Baurovskis on 23/05/2019.
//  Copyright © 2019 iOSCoder All rights reserved.
//

import Alamofire
import Foundation

public extension APIClient {
  
  func send<T: APIRequest>(_ request: T, completion: @escaping ResultCallback<T.Response>) -> DataRequest? {
    var headers = self.headers
    if let requestSpecificHeaders = request.headers {
      requestSpecificHeaders.forEach { key, value in headers[key] = value }
    }
    
    guard let endpointUrl = URL(string: self.baseURL.absoluteString + request.endpoint) else {
      completion(.failure(APIError.invalidRequest))
      return nil
    }
    
    let processResponse: (Data) -> Void = { data in
      do {
        let response = try JSONDecoder().decode(T.Response.self, from: data)
        completion(.success(response))
      } catch {
        completion(.failure(error))
      }
    }
    
    let dataTask = self.sessionManager.request(endpointUrl,
                                               method: request.method,
                                               parameters: request.parameters,
                                               encoding: request.encoding,
                                               headers: headers)
    dataTask
        .validate()
        .responseJSON { [weak self] response in
            if let error = self?.validate(response: response) {
                completion(.failure(error))
                return
            }

            guard let data = response.data else {
                completion(.failure(APIError.invalidResponse))
                return
            }

            processResponse(data)
    }

    return dataTask
  }
  
  func cancel() {
    sessionManager.session.getTasksWithCompletionHandler { sessionDataTask, uploadData, downloadData in
      sessionDataTask.forEach { $0.cancel() }
      uploadData.forEach { $0.cancel() }
      downloadData.forEach { $0.cancel() }
    }
  }
}
