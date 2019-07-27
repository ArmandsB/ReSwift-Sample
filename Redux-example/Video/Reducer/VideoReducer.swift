//
//  VideoReducer.swift
//  Redux-example
//
//  Created by Armands Baurovskis on 27/07/2019.
//  Copyright © 2019 iOSCoder. All rights reserved.
//

import Foundation
import ReSwift

func videoReducer(action: Action, state: VideoState?) -> VideoState {
  var state = state ?? VideoState()
  switch action {
  case let action as SetVideoPositionAction:
    state.previousPosition = state.position
    state.position = action.videoPosition
  default:
    break
  }

  return state
}

