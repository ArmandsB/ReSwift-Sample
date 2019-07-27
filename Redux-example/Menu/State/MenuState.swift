//
//  MenuState.swift
//  Redux-example
//
//  Created by Armands Baurovskis on 27/07/2019.
//  Copyright © 2019 iOSCoder. All rights reserved.
//

import Foundation
import ReSwift

struct MenuState: StateType, Equatable {
  var isOpen: Bool = false
}

func ==(lhs: MenuState, rhs: MenuState) -> Bool {
  return lhs.isOpen == rhs.isOpen
}

