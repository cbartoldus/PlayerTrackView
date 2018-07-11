//
//  PlayerTrackViewUITests.swift
//  PlayerTrackViewUITests
//
//  Created by Chris Bartoldus on 7/10/18.
//  Copyright © 2018 Chris Bartoldus. All rights reserved.
//

import XCTest

class PlayerTrackViewUITests: XCTestCase {
        
    override func setUp() {
        super.setUp()
        
        // Put setup code here. This method is called before the invocation of each test method in the class.
        
        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false
        // UI tests must launch the application that they test. Doing this in setup will make sure it happens for each test method.
        XCUIApplication().launch()

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testExample() {
        
        let app = XCUIApplication()
        let element2 = app.children(matching: .window).element(boundBy: 0).children(matching: .other).element
        let element = element2.children(matching: .other).element(boundBy: 0)
        let textField = element.children(matching: .textField).element(boundBy: 0)
        textField.tap()
        textField.typeText("Chris")
        
        let textField2 = element.children(matching: .textField).element(boundBy: 1)
        textField2.tap()
        textField2.typeText("Alex")
        
        let textField3 = element.children(matching: .textField).element(boundBy: 2)
        textField3.tap()
        textField3.typeText("Added by Me")
        
        let textField4 = element.children(matching: .textField).element(boundBy: 3)
        textField4.tap()
        textField4.typeText("200")
        app.buttons["DONE"].tap()
        
        let textField5 = element2.children(matching: .other).element(boundBy: 2).children(matching: .textField).element
        textField5.tap()
        textField5.typeText(".5")
        app.buttons["Display Current Time"].tap()
        
        // Use recording to get started writing UI tests.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }
    
}
