//
//  ChatViewController.swift
//  Redux-example
//
//  Created by Armands Baurovskis on 29/07/2019.
//  Copyright © 2019 iOSCoder. All rights reserved.
//

import UIKit
import ReSwift

class ChatViewController: UIViewController {

    private let tableView = UITableView(frame: .zero, style: .plain)
    private let spinnerView = UIActivityIndicatorView(style: .gray)
    private var data: [Post] = []
    private let postsService: GetPostsServiceEndpoints = GetPostsService(service: apiClient)

    init() {
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Chat"
        
        self.view.addSubview(tableView)
        self.view.addSubview(spinnerView)
        
        tableView.dataSource = self
        tableView.delegate = self

        spinnerView.hidesWhenStopped = true

        store.dispatch(ChatAction.clear)
        store.dispatch(ChatAction.fetch)
        store.dispatch(fetchChatPostsAction(service: postsService))
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        tableView.frame = self.view.bounds
        spinnerView.center = self.view.center
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        store.subscribe(self) {
            $0.select {
                $0.chatState
            }
        }
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillAppear(animated)
        store.unsubscribe(self)
    }
}

extension ChatViewController: StoreSubscriber {
    typealias StoreSubscriberStateType = ChatState
    func newState(state: ChatState) {
        switch state.state {
        case .loading:
            self.spinnerView.startAnimating()
            self.data = []
            self.tableView.reloadData()
        case .posts(let posts):
            self.spinnerView.stopAnimating()
            self.data = posts
            self.tableView.reloadData()
        }
    }
}

extension ChatViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let post = data[indexPath.row]
        let cell = UITableViewCell(style: .subtitle, reuseIdentifier: nil)
        cell.textLabel?.text = post.title
        cell.detailTextLabel?.text = post.body
        return cell
    }
}
