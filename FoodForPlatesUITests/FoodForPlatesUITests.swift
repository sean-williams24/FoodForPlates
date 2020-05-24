//
//  FoodForPlatesUITests.swift
//  FoodForPlatesUITests
//
//  Created by Sean Williams on 22/05/2020.
//  Copyright © 2020 Sean Williams. All rights reserved.
//

import XCTest

class FoodForPlatesUITests: XCTestCase {

    override func setUpWithError() throws {
        XCUIApplication().launch()

        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    
    func testInitialStateIsCorrect() {
        let table = XCUIApplication().tables
        
        XCTAssertEqual(table.cells.count, 4)
    }
    
    
    func testCategoryFilterOnBrowseMenu() {
        let app = XCUIApplication()
        app.tabBars.buttons["Browse"].tap()
        
        app.buttons["FOOD"].tap()
        XCTAssertEqual(app.tables.cells.count, 8, "There should be 8 food cells")

        app.buttons["DRINKS"].tap()
        XCTAssertEqual(app.tables.cells.count, 8, "There should be 8 Drink cells")

        app.buttons["COFFEE"].tap()
        XCTAssertEqual(app.tables.cells.count, 5, "There should be 5 coffee cells")

        app.buttons["SHOPPING"].tap()
        XCTAssertEqual(app.tables.cells.count, 3, "There should be 3 shopping cells")

        app.buttons["MARKETS"].tap()
        XCTAssertEqual(app.tables.cells.count, 2, "There should be 2 markets cells")

        app.buttons["ALL"].tap()
        XCTAssertEqual(app.tables.cells.count, 26, "There should be 26 cells in total")
    }

    func testCategoryFilterSpeed() {
        let app = XCUIApplication()
        app.tabBars.buttons["Browse"].tap()
        measure {
            app.buttons["FOOD"].tap()
            app.buttons["ALL"].tap()
        }
    }
    

    func testAreaFilterOnBrowseMenu() {
        
        let app = XCUIApplication()
        app.tabBars.buttons["Browse"].tap()
        
        let locationFillButton = app.navigationBars["Food_For_Plates.BrowseVC"].buttons["location.fill"]
        locationFillButton.tap()
        
        let button = app.children(matching: .window).element(boundBy: 0).children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .button).element
        button.tap()
        XCTAssertEqual(app.tables.cells.count, 26, "Should show all 26 venues")
        locationFillButton.tap()
        button.tap()
        XCTAssertEqual(app.tables.cells.count, 5, "London Fields should show 5 venues")

        
    }
    
    func testFavouritesFilterOnBrowseView() {
         
        let app = XCUIApplication()
        app.tabBars.buttons["Browse"].tap()
        
        let navBar = app.navigationBars["Food_For_Plates.BrowseVC"]
        navBar.buttons["Item"].tap()
        
        XCTAssertEqual(app.tables.cells.count, 2, "favourites count should be 2")
        
        navBar.buttons["arrow.clockwise"].tap()
        
        XCTAssertEqual(app.tables.cells.count, 26, "should show 26 venues when not viewing favourites")

    
        
    }

    func testLaunchPerformance() throws {
        if #available(macOS 10.15, iOS 13.0, tvOS 13.0, *) {
            // This measures how long it takes to launch your application.
            measure(metrics: [XCTOSSignpostMetric.applicationLaunch]) {
                XCUIApplication().launch()
            }
        }
    }
}
