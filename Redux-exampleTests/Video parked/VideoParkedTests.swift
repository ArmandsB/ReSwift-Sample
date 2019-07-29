//
//  VideoParkedTests.swift
//  Redux-exampleTests
//
//  Created by Armands Baurovskis on 29/07/2019.
//  Copyright © 2019 iOSCoder. All rights reserved.
//

import Foundation
import XCTest
import ReSwift
@testable import Redux_example

class VideoParkedTests: XCTestCase {

    func testVideoParked() {
        XCTAssertEqual(store.state.videoState.position, .parked)
        XCTAssertEqual(store.state.videoState.previousPosition, nil)
        store.dispatch(SetVideoPositionAction(videoPosition: .normal))
        XCTAssertEqual(store.state.videoState.position, .normal)
        XCTAssertEqual(store.state.videoState.previousPosition, .parked)
    }

    func testVideoStateAfterMenuOpenWithNormal() {
        XCTAssertEqual(store.state.videoState.position, .parked)
        XCTAssertEqual(store.state.videoState.previousPosition, nil)
        store.dispatch(SetVideoPositionAction(videoPosition: .normal))
        XCTAssertEqual(store.state.videoState.position, .normal)
        store.dispatch(MenuAction.open)
        XCTAssertEqual(store.state.videoState.position, .parked)
        store.dispatch(MenuAction.closed)
        XCTAssertEqual(store.state.videoState.position, .normal)
    }

    func testVideoStateAfterMenuOpenWithParked() {
        XCTAssertEqual(store.state.videoState.position, .parked)
        XCTAssertEqual(store.state.videoState.previousPosition, nil)
        store.dispatch(MenuAction.open)
        XCTAssertEqual(store.state.videoState.position, .parked)
        store.dispatch(MenuAction.closed)
        XCTAssertEqual(store.state.videoState.position, .parked)
    }
}
