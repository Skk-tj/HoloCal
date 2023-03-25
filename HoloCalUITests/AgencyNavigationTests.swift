//
//  AgencyNavigationTests.swift
//  HoloCalUITests
//
// 
//

import XCTest

final class AgencyNavigationTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.

        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testLiveAgencies() throws {
        let app = XCUIApplication()
        app.launch()
        
        app.tabBars.buttons["Live"].tap()
        
        for agency in AgencyEnum.allCases {
            let cell = app.collectionViews.buttons["\(agencyEnumToAgency[agency]!.names[.en]!), \(agencyEnumToAgency[agency]!.names[.ja]!)"]
            XCTAssertTrue(cell.exists)
            
            cell.tap()
            
            let navigation = app.navigationBars[agencyEnumToAgency[agency]!.names[.en]!]
            XCTAssertTrue(navigation.exists)
            
            let backButton = navigation.buttons["Live"]
            backButton.tap()
        }
        
        let cell = app.collectionViews.buttons["My Favorites"]
        XCTAssertTrue(cell.exists)
        cell.tap()
        
        let navigation = app.navigationBars["My Favorites"]
        XCTAssertTrue(navigation.exists)
    }
    
    func testUpcomingAgencies() throws {
        let app = XCUIApplication()
        app.launch()
        
        app.tabBars.buttons["Upcoming"].tap()
        
        for agency in AgencyEnum.allCases {
            let cell = app.collectionViews.buttons["\(agencyEnumToAgency[agency]!.names[.en]!), \(agencyEnumToAgency[agency]!.names[.ja]!)"]
            XCTAssertTrue(cell.exists)
            
            cell.tap()
            
            let navigation = app.navigationBars[agencyEnumToAgency[agency]!.names[.en]!]
            XCTAssertTrue(navigation.exists)
            
            let backButton = navigation.buttons["Upcoming"]
            backButton.tap()
        }
        
        let cell = app.collectionViews.buttons["My Favorites"]
        XCTAssertTrue(cell.exists)
        cell.tap()
        
        let navigation = app.navigationBars["My Favorites"]
        XCTAssertTrue(navigation.exists)
    }
    
    func testPastAgencies() throws {
        let app = XCUIApplication()
        app.launch()
        
        app.tabBars.buttons["Past"].tap()
        
        for agency in AgencyEnum.allCases {
            let cell = app.collectionViews.buttons["\(agencyEnumToAgency[agency]!.names[.en]!), \(agencyEnumToAgency[agency]!.names[.ja]!)"]
            XCTAssertTrue(cell.exists)
            
            cell.tap()
            
            let navigation = app.navigationBars[agencyEnumToAgency[agency]!.names[.en]!]
            XCTAssertTrue(navigation.exists)
            
            let backButton = navigation.buttons["Past"]
            backButton.tap()
        }
        
        let cell = app.collectionViews.buttons["My Favorites"]
        XCTAssertTrue(cell.exists)
        cell.tap()
        
        let navigation = app.navigationBars["My Favorites"]
        XCTAssertTrue(navigation.exists)
    }
}
