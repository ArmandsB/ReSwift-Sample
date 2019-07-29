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
  private let chatButton = UIButton(type: .custom)


  override func viewDidLoad() {
    super.viewDidLoad()
    self.addButtons()
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

  private func addButtons() {
    closeButton.setTitle("Close", for: .normal)
    closeButton.backgroundColor = UIColor.red.withAlphaComponent(0.5)
    closeButton.setTitleColor(.white, for: .normal)
    closeButton.addTarget(self, action: #selector(closeButtonTapped), for: .touchUpInside)

    chatButton.setTitle("Chat", for: .normal)
    chatButton.backgroundColor = UIColor.red.withAlphaComponent(0.5)
    chatButton.setTitleColor(.white, for: .normal)
    chatButton.addTarget(self, action: #selector(chatButtontapped), for: .touchUpInside)

    let stackView = UIStackView(arrangedSubviews: [closeButton, chatButton])
    stackView.axis = .vertical
    stackView.spacing = 12

    let size = CGSize(width: 50, height: 112)
    let frame = CGRect(origin: CGPoint(x: 50, y: self.view.frame.size.height - size.height - 100), size: size)
    stackView.frame = frame
    self.view.addSubview(stackView)
  }

  @objc
  private func closeButtonTapped() {
    if store.state.menuState.isOpen {
      store.dispatch(MenuAction.closed)
    } else {
      store.dispatch(MenuAction.open)
    }
  }

    @objc
    private func chatButtontapped() {
        store.dispatch(MenuAction.closed)
        let chatViewController = ChatViewController()
        self.navigationController?.pushViewController(chatViewController, animated: true)
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
