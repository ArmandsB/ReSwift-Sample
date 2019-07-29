//
//  AppStore.swift
//  Redux-example
//
//  Created by Armands Baurovskis on 27/07/2019.
//  Copyright © 2019 iOSCoder. All rights reserved.
//

import Foundation
import ReSwift
import ReSwiftThunk

private let thunkMiddleware: Middleware<AppState> = createThunksMiddleware()
let apiClient = API()
private let postsService: GetPostsServiceEndpoints = GetPostsService(service: apiClient)

let store = Store<AppState>(
  reducer: appReducer,
  state: nil,
  middleware: [videoParkedLogicMiddleware,
               fetchChatPostsMiddleWare(service: postsService),
               thunkMiddleware]
)

