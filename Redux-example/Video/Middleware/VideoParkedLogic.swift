//
//  VideoParkedLogic.swift
//  Redux-example
//
//  Created by Armands Baurovskis on 27/07/2019.
//  Copyright © 2019 iOSCoder. All rights reserved.
//

import Foundation
import ReSwift

let videoParkedLogicMiddleware: Middleware<AppState> = { dispatch, getState in
  return { next in
    return { action in
      guard let state = getState(), action is MenuAction || action is SetVideoPositionAction else {
        next(action)
        return
      }

      switch action {
      case let action as MenuAction:
        switch action {
        case .open:
          dispatch(SetVideoPositionAction(videoPosition: .parked))
        case .closed:
          if let previousPosition = state.videoState.previousPosition {
            next(action)
            dispatch(SetVideoPositionAction(videoPosition: previousPosition))
            return
          }
        }
      case let action as SetVideoPositionAction:
        guard state.menuState.isOpen == false else { return }
      default:
        break
      }

      next(action)
    }
  }
}

