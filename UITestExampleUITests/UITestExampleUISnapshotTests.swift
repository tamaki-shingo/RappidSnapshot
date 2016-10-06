//
//  UITestExampleUISnapshotTests.swift
//  UITestExample
//
//  Created by tamaki on 8/27/16.
//  Copyright © 2016 tamaki. All rights reserved.
//

import XCTest

class UITestExampleUISnapshotTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        continueAfterFailure = false
        let app = XCUIApplication()
        setupSnapshot(app)
        app.launch()
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func testSnapshot() {
        
        let app = XCUIApplication()
        app.textFields["login_id"].tap()
        app.textFields["login_id"].typeText("goal-star")
        app.secureTextFields["login_pass"].tap()
        app.secureTextFields["login_pass"].typeText("abc")
        app.buttons["login_button"].tap()
        app.buttons["next_announce"].tap()
        app.textViews["text_apology"].tap()
        app.textViews["text_apology"].typeText("ごめんぽ")
        app.buttons["submit"].tap()
        snapshot("topView")

        app.buttons["next_top"].tap()
        app.buttons["ok"].tap()
        app.buttons["next_1"].tap()
        app.buttons["next_2"].tap()
        snapshot("lastView")
        
    }


}
