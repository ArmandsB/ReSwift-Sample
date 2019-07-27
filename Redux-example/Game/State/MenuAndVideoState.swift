//
//  MenuAndVideoState.swift
//  Redux-example
//
//  Created by Armands Baurovskis on 27/07/2019.
//  Copyright © 2019 iOSCoder. All rights reserved.
//

import Foundation

struct MenuAndVideoState: Equatable {
  let videoState: VideoState
  let menuState: MenuState

  init(state: AppState) {
    self.videoState = state.videoState
    self.menuState = state.menuState
  }
}

func ==(lhs: MenuAndVideoState, rhs: MenuAndVideoState) -> Bool {
  return lhs.videoState == rhs.videoState && lhs.menuState == rhs.menuState
}
