//
//  Post.swift
//  Redux-example
//
//  Created by Armands Baurovskis on 29/07/2019.
//  Copyright © 2019 iOSCoder. All rights reserved.
//

import Foundation

public struct Post: Decodable, Equatable {
    public let id: UInt
    public let userId: UInt
    public let title: String
    public let body: String
}

public func ==(lhs: Post, rhs: Post) -> Bool {
    return lhs.id == rhs.id
}
