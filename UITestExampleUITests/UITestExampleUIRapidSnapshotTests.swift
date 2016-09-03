//
//  UITestExampleUIRapidSnapshotTests.swift
//  UITestExample
//
//  Created by tamaki on 8/27/16.
//  Copyright © 2016 tamaki. All rights reserved.
//

import XCTest

class UITestExampleUIRapidSnapshotTests: XCTestCase {
    override func setUp() {
        super.setUp()
        continueAfterFailure = false
    }
    
    override func tearDown() {
        super.tearDown()
    }

    func testExample() {
        
        var app = XCUIApplication()
        setupSnapshot(app)
        app.launchArguments.appendContentsOf(["-rootViewController", "top", "-appStatus", AppStatusType.LOGIN.rawValue])
        app.launch()
        snapshot("topView")
        app.terminate()
        
        app = XCUIApplication()
        app.launchArguments.appendContentsOf(["-rootViewController", "content_3", "-appStatus", AppStatusType.LOGIN.rawValue])
        app.launch()
        snapshot("lastView")
        app.terminate()
    }

}
