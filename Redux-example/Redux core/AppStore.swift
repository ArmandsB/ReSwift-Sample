//
//  AppStore.swift
//  Redux-example
//
//  Created by Armands Baurovskis on 27/07/2019.
//  Copyright © 2019 iOSCoder. All rights reserved.
//

import Foundation
import ReSwift

let store = Store<AppState>(
  reducer: appReducer,
  state: nil,
  middleware: [videoParkedLogicMiddleware]
)
