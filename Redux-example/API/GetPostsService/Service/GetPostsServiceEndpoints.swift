//
//  GetPostsServiceEndpoints.swift
//  Redux-example
//
//  Created by Armands Baurovskis on 29/07/2019.
//  Copyright © 2019 iOSCoder. All rights reserved.
//

import Foundation

public protocol GetPostsServiceEndpoints: APIService {
    func getPosts(completion: @escaping (Result<GetPostsResponse, Error>) -> Void)
}

