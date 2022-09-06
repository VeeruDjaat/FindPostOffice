//
//  FindPostOfficeVCTest.swift
//  FindPostOfficeTests
//
//  Created by Dharmendra Chaudhary on 06/09/22.
//

import XCTest
@testable import FindPostOffice

class FindPostOfficeVCTest: XCTestCase {

    var vc = FindPostOfficeViewController()

    override func setUpWithError() throws {
        vc.loadViewIfNeeded()
    }

    func testViewController_WhenCreated_HasSearchBar() throws {
        //helps us unwrap optional values
        let searchBar = try XCTUnwrap(vc.searchBar, "Search Bar IBOutlet")
        XCTAssertEqual(searchBar.text, "110092", "Search Bar is not empty when view controller initially loaded")
    }
    
    func testViewController_WhenCreated_HasDescriptionLabel() throws {
        //helps us unwrap optional values
        let messageLabel = try XCTUnwrap(vc.messageLabel, "messageLabel IBOutlet")
        XCTAssertEqual(messageLabel.text, "", "messageLabel is empty when view controller initially loaded")
    }
    
    func testViewController_WhenCreated_HasTableViewOutlet() throws {
        //helps us unwrap optional values
        let listTableView = try XCTUnwrap(vc.listTableView, "listTableView IBOutlet")
        XCTAssertEqual(listTableView.accessibilityIdentifier,"poTableView", "accessibilityIdentifier is set when view controller initially loaded")
    }


}
