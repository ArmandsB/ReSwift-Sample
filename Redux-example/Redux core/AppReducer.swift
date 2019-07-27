//
//  AppReducer.swift
//  Redux-example
//
//  Created by Armands Baurovskis on 27/07/2019.
//  Copyright © 2019 iOSCoder. All rights reserved.
//

import Foundation
import ReSwift

func appReducer(action: Action, state: AppState?) -> AppState {
  return AppState(
    videoState: videoReducer(action: action, state: state?.videoState),
    menuState: menuReducer(action: action, state: state?.menuState)
  )
}
