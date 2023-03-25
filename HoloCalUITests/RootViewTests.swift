//
//  HoloCalUITests.swift
//  HoloCalUITests
//
//
//

import XCTest

class RootViewTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.

        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testTabBar() throws {
        let app = XCUIApplication()
        app.launch()
        
        XCTAssertTrue(app.tabBars.buttons["Live"].exists)
        XCTAssertTrue(app.tabBars.buttons["Upcoming"].exists)
        XCTAssertTrue(app.tabBars.buttons["Past"].exists)
        XCTAssertTrue(app.tabBars.buttons["Concerts"].exists)
        XCTAssertTrue(app.tabBars.buttons["Settings"].exists)
    }
    
    func testNavigationTitles() throws {
        let app = XCUIApplication()
        app.launch()
        
        app.tabBars.buttons["Live"].tap()
        XCTAssertTrue(app.navigationBars.staticTexts["Live"].exists)
        
        app.tabBars.buttons["Upcoming"].tap()
        XCTAssertTrue(app.navigationBars.staticTexts["Upcoming"].exists)
        
        app.tabBars.buttons["Past"].tap()
        XCTAssertTrue(app.navigationBars.staticTexts["Past"].exists)
        
        app.tabBars.buttons["Concerts"].tap()
        XCTAssertTrue(app.navigationBars.staticTexts["Concerts"].exists)
        
        app.tabBars.buttons["Settings"].tap()
        XCTAssertTrue(app.navigationBars.staticTexts["Settings"].exists)
    }
    
    func testJapaneseTabBar() throws {
        let app = XCUIApplication()
        app.launchArguments = [
            "-AppleLanguages",
            "(ja)",
            "-AppleLocale",
            "ja_JP"
        ]
        
        app.launch()
        
        XCTAssertTrue(app.tabBars.buttons["配信中"].exists)
        XCTAssertTrue(app.tabBars.buttons["今後の配信"].exists)
        XCTAssertTrue(app.tabBars.buttons["設定"].exists)
    }
    
    func testSettingsSectionHeaderText() throws {
        let app = XCUIApplication()
        app.launch()
        
        app.tabBars.buttons["Settings"].tap()
        XCTAssertTrue(app.staticTexts["UPCOMING SCHEDULE"].exists)
    }
}
