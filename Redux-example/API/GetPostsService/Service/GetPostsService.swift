//
//  GetPostsService.swift
//  Redux-example
//
//  Created by Armands Baurovskis on 29/07/2019.
//  Copyright © 2019 iOSCoder. All rights reserved.
//

import Foundation

public class GetPostsService: GetPostsServiceEndpoints {

    public let service: APIClient
    public init(service: APIClient) {
        self.service = service
    }

    public func getPosts(completion: @escaping (Result<GetPostsResponse, Error>) -> Void) {
        let request = GetPostsRequest()
        _ = self.service.send(request, completion: completion)
    }
}

