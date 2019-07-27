//
//  VideoState.swift
//  Redux-example
//
//  Created by Armands Baurovskis on 27/07/2019.
//  Copyright © 2019 iOSCoder. All rights reserved.
//

import Foundation
import ReSwift

struct VideoState: StateType, Equatable {

  enum Position {
    case normal
    case parked
  }

  var position: Position = .parked
  var previousPosition: Position?

}

func ==(lhs: VideoState, rhs: VideoState) -> Bool {
  return lhs.position == rhs.position
}
