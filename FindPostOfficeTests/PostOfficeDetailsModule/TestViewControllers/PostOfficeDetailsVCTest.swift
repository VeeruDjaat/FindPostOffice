//
//  FindPostOfficeVCTest.swift
//  FindPostOfficeTests
//
//  Created by Dharmendra Chaudhary on 06/09/22.
//

import XCTest
@testable import FindPostOffice

class PostOfficeDetailsVCTest: XCTestCase {
    
    var vc = PostOfficeDetailsViewController()
    
    override func setUpWithError() throws {
        vc.loadViewIfNeeded()
    }
    
//    func testViewController_WhenCreated_HasNameLabel() throws {
//        //helps us unwrap optional values
//        let nameLabel = try XCTUnwrap(vc.nameLabel, "nameLabel is not connected to an IBOutlet")
//        XCTAssertEqual(nameLabel.text, "Name", "nameLabel is not empty when view controller initially loaded")
//    }
    
//    func testViewController_WhenCreated_HasBranchLabel() throws {
//        //helps us unwrap optional values
//        let branchLabel = try XCTUnwrap(vc.branchLabel, "branchLabel is not connected to an IBOutlet")
//        XCTAssertEqual(branchLabel.text, "Branch type", "branchLabel is not empty when view controller initially loaded")
//    }
//    func testViewController_WhenCreated_HasCircleLabel() throws {
//        //helps us unwrap optional values
//        let circleLabel = try XCTUnwrap(vc.circleLabel, "CircleLabel is not connected to an IBOutlet")
//        XCTAssertEqual(circleLabel.text, "Circle", "CircleLabel is not empty when view controller initially loaded")
//    }
    
}
