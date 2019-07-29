//
//  ChatReducer.swift
//  Redux-example
//
//  Created by Armands Baurovskis on 29/07/2019.
//  Copyright © 2019 iOSCoder. All rights reserved.
//

import Foundation
import ReSwift

func chatReducer(action: Action, state: ChatState?) -> ChatState {
    var state = state ?? ChatState()
    guard let chatAction = action as? ChatAction else {
        return state
    }

    switch chatAction {
    case .clear:
        state = ChatState()
    case .set(let chatState):
        state.state = chatState
    default:
        break
    }

    return state
}

