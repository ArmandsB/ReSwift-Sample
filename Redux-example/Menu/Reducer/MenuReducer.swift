//
//  MenuReducer.swift
//  Redux-example
//
//  Created by Armands Baurovskis on 27/07/2019.
//  Copyright © 2019 iOSCoder. All rights reserved.
//

import Foundation
import ReSwift

func menuReducer(action: Action, state: MenuState?) -> MenuState {
  var state = state ?? MenuState()
  guard let menuAction = action as? MenuAction else {
    return state
  }

  switch menuAction {
  case .open:
    state.isOpen = true
  case .closed:
    state.isOpen = false
  }

  return state
}

