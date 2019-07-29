//
//  ChatState.swift
//  Redux-example
//
//  Created by Armands Baurovskis on 29/07/2019.
//  Copyright © 2019 iOSCoder. All rights reserved.
//

import Foundation
import ReSwift

struct ChatState: StateType, Equatable {

    enum DataState: Equatable {
        case loading
        case posts([Post])
    }

    var state: DataState = .posts([])
}

func ==(lhs: ChatState.DataState, rhs: ChatState.DataState) -> Bool {
    switch (lhs, rhs) {
    case (.loading, .loading):
        return true
    case (.posts(let lhsData), .posts(let rhsData)):
        return lhsData == rhsData
    default:
        return false
    }
}

func ==(lhs: ChatState, rhs: ChatState) -> Bool {
    return lhs.state == rhs.state
}
