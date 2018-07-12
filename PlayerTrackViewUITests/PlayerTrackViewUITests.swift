//
//  PlayerTrackViewUITests.swift
//  PlayerTrackViewUITests
//
//  Created by Chris Bartoldus on 7/10/18.
//  Copyright © 2018 Chris Bartoldus. All rights reserved.
//

import XCTest
@testable import PlayerTrackView

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
        
        let songTitle = "Alex"
        let artistName = "Chris"
        let reasonAdded = "Added by Me"
        let duration = "121"
        let currentTime = "0.2"
        
        
        
        
        let songtitleindentifierTextField = app.textFields["songTitleFieldIndentifier"]
        songtitleindentifierTextField.tap()
        songtitleindentifierTextField.typeText(songTitle)
        
        let artistnameidentifierTextField = app.textFields["artistNameFieldIdentifier"]
        artistnameidentifierTextField.tap()
        artistnameidentifierTextField.tap()
        artistnameidentifierTextField.typeText(artistName)
        
        let reasonaddedidentifierTextField = app.textFields["reasonAddedFieldIdentifier"]
        reasonaddedidentifierTextField.tap()
        reasonaddedidentifierTextField.tap()
        reasonaddedidentifierTextField.typeText(reasonAdded)
        
        let durationidentfierTextField = app.textFields["durationFieldIdentfier"]
        durationidentfierTextField.tap()
        durationidentfierTextField.tap()
        durationidentfierTextField.typeText(duration)
        
        let currenttimeidentifierTextField = app.textFields["currentTimeFieldIdentifier"]
        currenttimeidentifierTextField.tap()
        currenttimeidentifierTextField.typeText(currentTime)
    
        app/*@START_MENU_TOKEN@*/.buttons["doneButtonIdentifier"]/*[[".buttons[\"DONE\"]",".buttons[\"doneButtonIdentifier\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        app/*@START_MENU_TOKEN@*/.buttons["displayCurrentTimeIdentifier"]/*[[".buttons[\"Display Current Time\"]",".buttons[\"displayCurrentTimeIdentifier\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        
        XCTAssertEqual("0:24", app.staticTexts.element(matching: .any, identifier: "currentTimeIdentifier").label)
        XCTAssertEqual("2:01", app.staticTexts.element(matching: .any, identifier: "durationIdentifier").label) //currentTime test
        
        app.buttons["startSongTimerButtonIdentifier"].tap()
        
        
        XCTAssertEqual(songTitle, app.staticTexts.element(matching: .any, identifier: "songTitleIdentifier").label)
        XCTAssertEqual(artistName, app.staticTexts.element(matching: .any, identifier: "artistIdentifier").label)
        XCTAssertEqual(reasonAdded, app.staticTexts.element(matching: .any, identifier: "reasonAddedIdentifier").label) //reason added test
        
        
        
        // Use recording to get started writing UI tests.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }
    
}
