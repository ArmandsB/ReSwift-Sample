//
//  GameViewController.swift
//  Redux-example
//
//  Created by Armands Baurovskis on 27/07/2019.
//  Copyright © 2019 iOSCoder. All rights reserved.
//

import UIKit
import ReSwift

class GameViewController: UIViewController {
  private let menuViewController = MenuViewController()
  private let videoViewController = VideoViewController()
  private let menuButton = UIButton(type: .custom)

  init() {
    super.init(nibName: nil, bundle: nil)
  }
  
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

  override func viewDidLoad() {
    super.viewDidLoad()
    self.view.backgroundColor = .white
    self.title = "Game"

    self.addMenuButton()
    self.add(child: menuViewController)
    self.add(child: videoViewController)

    self.moveMenu(isOpen: false)
  }

  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    store.subscribe(self) { $0.select(MenuAndVideoState.init) }
  }

  override func viewWillDisappear(_ animated: Bool) {
    super.viewWillAppear(animated)
    store.unsubscribe(self)
  }

  private func add(child: UIViewController) {
    addChild(child)
    view.addSubview(child.view)
    child.didMove(toParent: self)
  }

}

extension GameViewController: StoreSubscriber {
  typealias StoreSubscriberStateType = MenuAndVideoState
  func newState(state: MenuAndVideoState) {
    self.menuButton.alpha = state.menuState.isOpen ? 0.0 : 1.0
    self.moveMenu(isOpen: state.menuState.isOpen)
    self.moveVideo(position: state.videoState.position)
  }
}

extension GameViewController {

  func moveMenu(isOpen: Bool) {
    let position = isOpen ? CGPoint(x: 150, y: 0) : CGPoint(x: self.view.frame.width, y: 0)
    let frame = CGRect(origin: position,
                       size: CGSize(width: self.view.frame.width - position.x,
                                    height: self.view.frame.height))
    UIView.animate(withDuration: 0.3) {
      self.menuViewController.view.frame = frame
    }
  }

}

extension GameViewController {

  func moveVideo(position: VideoState.Position) {
    let frame: CGRect

    switch position {
    case .normal:
      let videoSize = CGSize(width: 150, height: 150)
      frame = CGRect(origin: CGPoint(x: (self.view.frame.width - videoSize.width) / 2.0,
                                     y: (self.view.frame.height - videoSize.height) / 2.0),
                     size: videoSize)
    case .parked:
      let videoSize = CGSize(width: 70, height: 70)
      frame = CGRect(origin: CGPoint(x: 20,
                                     y: self.view.frame.height - 70 - videoSize.height),
                     size: videoSize)
    }

    UIView.animate(withDuration: 0.3) {
      self.videoViewController.view.frame = frame
    }
  }

}

extension GameViewController {

  private func addMenuButton() {
    menuButton.setTitle("Open", for: .normal)
    menuButton.backgroundColor = UIColor.blue.withAlphaComponent(0.3)
    menuButton.setTitleColor(.white, for: .normal)
    menuButton.addTarget(self, action: #selector(menuButtonTapped), for: .touchUpInside)

    let size = CGSize(width: 50, height: 50)
    let frame = CGRect(origin: CGPoint(x: self.view.frame.width - size.width - 50, y: 100), size: size)
    menuButton.frame = frame
    self.view.addSubview(menuButton)
  }

  @objc
  private func menuButtonTapped() {
    if !store.state.menuState.isOpen {
      store.dispatch(MenuAction.open)
    }
  }
}
