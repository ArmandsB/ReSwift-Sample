//
//  MenuViewController.swift
//  Redux-example
//
//  Created by Armands Baurovskis on 27/07/2019.
//  Copyright © 2019 iOSCoder. All rights reserved.
//

import UIKit
import ReSwift

class MenuViewController: UIViewController {


  private let closeButton = UIButton(type: .custom)


  override func viewDidLoad() {
    super.viewDidLoad()
    self.addCloseButton()
  }

  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    store.subscribe(self) {
      $0.select {
        $0.menuState
      }
    }
  }

  override func viewWillDisappear(_ animated: Bool) {
    super.viewWillAppear(animated)
    store.unsubscribe(self)
  }

}


extension MenuViewController {

  private func addCloseButton() {
    closeButton.setTitle("Close", for: .normal)
    closeButton.backgroundColor = UIColor.red.withAlphaComponent(0.5)
    closeButton.setTitleColor(.white, for: .normal)
    closeButton.addTarget(self, action: #selector(closeButtonTapped), for: .touchUpInside)

    let size = CGSize(width: 50, height: 50)
    let frame = CGRect(origin: CGPoint(x: 50, y: self.view.frame.size.height - size.height - 100), size: size)
    closeButton.frame = frame
    self.view.addSubview(closeButton)
  }

  @objc
  private func closeButtonTapped() {
    if store.state.menuState.isOpen {
      store.dispatch(MenuAction.closed)
    } else {
      store.dispatch(MenuAction.open)
    }
  }
}


extension MenuViewController: StoreSubscriber {

  typealias StoreSubscriberStateType = MenuState
  func newState(state: MenuState) {
    UIView.animate(withDuration: 0.3) {
      let color: UIColor = state.isOpen ? .blue : .red
      self.view.backgroundColor = color.withAlphaComponent(0.5)
    }
  }

}
