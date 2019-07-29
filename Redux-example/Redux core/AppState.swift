//
//  AppState.swift
//  Redux-example
//
//  Created by Armands Baurovskis on 27/07/2019.
//  Copyright © 2019 iOSCoder. All rights reserved.
//

import Foundation
import ReSwift


struct AppState: StateType {
  let videoState: VideoState
  let menuState: MenuState
  let chatState: ChatState
}
