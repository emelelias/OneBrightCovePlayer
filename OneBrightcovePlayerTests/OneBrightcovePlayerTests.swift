//
//  OneBrightcovePlayerTests.swift
//  OneBrightcovePlayerTests
//
//  Created by Emel Elias on 2019-10-08.
//  Copyright © 2019 Emel Elias. All rights reserved.
//

import XCTest
@testable import OneBrightcovePlayer

class OneBrightcovePlayerTests: XCTestCase {
    private var player: OneBrightCovePlayer?
    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        self.player = OneBrightCovePlayer()
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testPlayerViewNotNill() {
        let view = self.player?.playerView()
        XCTAssertNotNil(view)
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }

    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
