//
//  ChatMiddleware.swift
//  Redux-example
//
//  Created by Armands Baurovskis on 29/07/2019.
//  Copyright © 2019 iOSCoder. All rights reserved.
//

import Foundation
import ReSwift

func fetchChatPostsMiddleWare(service: GetPostsServiceEndpoints) -> Middleware<AppState> {

    return { dispatch, getState in
        return { next in
            return { action in
                guard let chatAction = action as? ChatAction, case .fetch = chatAction else {
                    next(action)
                    return
                }

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

                dispatch(ChatAction.set(.loading))
            }
        }
    }
}
