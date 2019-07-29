//
//  ChatActions.swift
//  Redux-example
//
//  Created by Armands Baurovskis on 29/07/2019.
//  Copyright © 2019 iOSCoder. All rights reserved.
//

import Foundation
import ReSwift
import ReSwiftThunk

enum ChatAction: Action {
    case fetch
    case clear
    case set(ChatState.DataState)
}
struct ClearChatContentAction : Action {}

func fetchChatPostsAction(service: GetPostsServiceEndpoints) -> Thunk<AppState> {
    return Thunk<AppState> { dispatch, getState in
        dispatch(ChatAction.set(.loading))
        service.getPosts(completion: { result in
            DispatchQueue.main.async {
                switch result {
                case .success(let data):
                    dispatch(ChatAction.set(.posts(data)))
                case .failure:
                    dispatch(ChatAction.set(.posts([])))
                }
            }
        })
    }
}
