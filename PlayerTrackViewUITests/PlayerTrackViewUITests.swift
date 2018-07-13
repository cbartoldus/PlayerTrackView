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
    
    
    let songTitle = "Alex"
    let artistName = "Chris"
    let reasonAdded = "Added by Me"
    let duration = "121"
    let currentTime = "0.2"
    
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
        super.tearDown()
    }
    
    //tests comparison between input strings and PlayerTrackViewText strings
    func testText() {
        
        let app = XCUIApplication()
        inputStringValues(songTitle: songTitle, artistName: artistName, reasonAdded: reasonAdded, duration: duration, currentTime: currentTime)
        
        app/*@START_MENU_TOKEN@*/.buttons["doneButtonIdentifier"]/*[[".buttons[\"DONE\"]",".buttons[\"doneButtonIdentifier\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        app/*@START_MENU_TOKEN@*/.buttons["displayCurrentTimeIdentifier"]/*[[".buttons[\"Display Current Time\"]",".buttons[\"displayCurrentTimeIdentifier\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        
        XCTAssertEqual("0:24", app.staticTexts.element(matching: .any, identifier: "currentTimeIdentifier").label)
        XCTAssertEqual("2:01", app.staticTexts.element(matching: .any, identifier: "durationIdentifier").label)
        XCTAssertEqual(songTitle, app.staticTexts.element(matching: .any, identifier: "songTitleIdentifier").label)
        XCTAssertEqual(artistName, app.staticTexts.element(matching: .any, identifier: "artistIdentifier" ).label)
        XCTAssertEqual(reasonAdded, app.staticTexts.element(matching: .any, identifier: "reasonAddedIdentifier").label)
    }
    
    func testButtonActions() {
        let app = XCUIApplication()
        inputStringValues(songTitle: songTitle, artistName: artistName, reasonAdded: reasonAdded, duration: duration, currentTime: currentTime)
        let durationInitial = app.staticTexts.element(matching: .any, identifier: "durationIdentifier").label
        let songTitleInitial = app.staticTexts.element(matching: .any, identifier: "songTitleIdentifier").label
        let artistNameInitial = app.staticTexts.element(matching: .any, identifier: "artistIdentifier" ).label
        let reasonAddedInitial = app.staticTexts.element(matching: .any, identifier: "reasonAddedIdentifier").label
        
        app/*@START_MENU_TOKEN@*/.buttons["doneButtonIdentifier"]/*[[".buttons[\"DONE\"]",".buttons[\"doneButtonIdentifier\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        XCTAssertFalse(songTitleInitial == songTitle && artistNameInitial == artistName && reasonAddedInitial == reasonAdded && durationInitial == duration)
        app/*@START_MENU_TOKEN@*/.buttons["displayCurrentTimeIdentifier"]/*[[".buttons[\"Display Current Time\"]",".buttons[\"displayCurrentTimeIdentifier\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        app.buttons["startSongTimerButtonIdentifier"].tap()
        
        
    }
    
    //tests  "hide"/"show" buttons
    func testHideShowButtons() {
        let app = XCUIApplication()
        
        XCTAssertTrue(app.buttons["muteButtonIdentifier"].isHittable)
        XCTAssertTrue(app.buttons["skipButtonIdentifier"].isHittable)
        app.buttons["hideFirstTwoButtonsIdentifier"].tap()
        XCTAssertFalse(app.buttons["muteButtonIdentifier"].exists)
        XCTAssertFalse(app.buttons["skipButtonIdentifier"].exists)
        app.buttons["showFirstTwoButtonsIdentifier"].tap()
        XCTAssertTrue(app.buttons["muteButtonIdentifier"].isHittable)
        XCTAssertTrue(app.buttons["skipButtonIdentifier"].isHittable)
    }
    
    
    func inputStringValues (songTitle: String, artistName: String, reasonAdded: String, duration: String, currentTime: String) {
        let app = XCUIApplication()
        let songtitleindentifierTextField = app.textFields["songTitleFieldIndentifier"]
        songtitleindentifierTextField.tap()
        songtitleindentifierTextField.typeText(songTitle)
        XCTAssertFalse(songtitleindentifierTextField.value as! String == "")
        
        let artistnameidentifierTextField = app.textFields["artistNameFieldIdentifier"]
        artistnameidentifierTextField.tap()
        artistnameidentifierTextField.tap()
        artistnameidentifierTextField.typeText(artistName)
        XCTAssertFalse(artistnameidentifierTextField.value as! String == "")
        
        let reasonaddedidentifierTextField = app.textFields["reasonAddedFieldIdentifier"]
        reasonaddedidentifierTextField.tap()
        reasonaddedidentifierTextField.tap()
        reasonaddedidentifierTextField.typeText(reasonAdded)
        XCTAssertFalse(reasonaddedidentifierTextField.value as! String == "")
        
        let durationidentfierTextField = app.textFields["durationFieldIdentfier"]
        durationidentfierTextField.tap()
        durationidentfierTextField.tap()
        durationidentfierTextField.typeText(duration)
        XCTAssertFalse(durationidentfierTextField.value as! String == "")
        
        let currenttimeidentifierTextField = app.textFields["currentTimeFieldIdentifier"]
        currenttimeidentifierTextField.tap()
        currenttimeidentifierTextField.typeText(currentTime)
        XCTAssertFalse(currenttimeidentifierTextField.value as! String == "")
    }
    
}
