//
//  FindPostOfficeUITests.swift
//  FindPostOfficeUITests
//
//  Created by Dharmendra Chaudhary on 07/09/22.
//

import XCTest

class FindPostOfficeUITests: XCTestCase {
        
    override func setUp() {
        super.setUp()
        continueAfterFailure = false
    }
    
    func testSearchBarAndTableViewLoad(){
        
        let app = XCUIApplication()
        app.launch()
        
        app.searchFields["Enter Pincode"].buttons["Clear text"].tap()
        
        let key = app/*@START_MENU_TOKEN@*/.keys["1"]/*[[".keyboards.keys[\"1\"]",".keys[\"1\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
        key.tap()
        key.tap()

        
        let key2 = app/*@START_MENU_TOKEN@*/.keys["0"]/*[[".keyboards.keys[\"0\"]",".keys[\"0\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
        key2.tap()
        key2.tap()
       
        
        let key3 = app/*@START_MENU_TOKEN@*/.keys["9"]/*[[".keyboards.keys[\"9\"]",".keys[\"9\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
        key3.tap()
        
        
        let key4 = app/*@START_MENU_TOKEN@*/.keys["2"]/*[[".keyboards.keys[\"2\"]",".keys[\"2\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
        key4.tap()
        
        app/*@START_MENU_TOKEN@*/.buttons["Search"]/*[[".keyboards",".buttons[\"search\"]",".buttons[\"Search\"]"],[[[-1,2],[-1,1],[-1,0,1]],[[-1,2],[-1,1]]],[0]]@END_MENU_TOKEN@*/.tap()
       
        app.tables["poTableView"].cells.containing(.staticText, identifier:"Anand Vihar").staticTexts["East Delhi"].tap()
        app.navigationBars["Anand Vihar"].buttons["Search Post Office"].tap()
        
    }
    
}
