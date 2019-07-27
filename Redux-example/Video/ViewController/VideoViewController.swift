//
//  VideoViewController.swift
//  Redux-example
//
//  Created by Armands Baurovskis on 27/07/2019.
//  Copyright © 2019 iOSCoder. All rights reserved.
//

import UIKit


class VideoViewController: UIViewController {

  var tapGesture: UITapGestureRecognizer!
  override func viewDidLoad() {
    super.viewDidLoad()
    self.view.backgroundColor = .purple

    self.view.isUserInteractionEnabled = true
    self.view.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(tapVideo)))
  }


  @objc func tapVideo() {
    switch store.state.videoState.position {
    case .normal:
      store.dispatch(SetVideoPositionAction(videoPosition: .parked))
    case .parked:
      store.dispatch(SetVideoPositionAction(videoPosition: .normal))
    }
  }
}

