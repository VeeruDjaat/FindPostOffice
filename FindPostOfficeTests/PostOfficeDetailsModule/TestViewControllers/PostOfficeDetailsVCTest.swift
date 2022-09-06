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

    func testViewController_HasNameLabel() throws {
        //helps us unwrap optional values
        let nameLabel = try XCTUnwrap(vc.nameLabel, "Name Label IBOutlet")
        XCTAssertNotNil(nameLabel)
    }
    
    func testViewController_HasBranchLabel() throws {
        //helps us unwrap optional values
        let branchLabel = try XCTUnwrap(vc.branchLabel, "branchLabel IBOutlet")
        XCTAssertNotNil(branchLabel)
    }
    
    func testViewController_HascircleLabel() throws {
        //helps us unwrap optional values
        let circleLabel = try XCTUnwrap(vc.circleLabel, "circleLabel IBOutlet")
        XCTAssertNotNil(circleLabel)
    }
    
    func testViewController_HasdistrictLabel() throws {
        //helps us unwrap optional values
        let districtLabel = try XCTUnwrap(vc.districtLabel, "districtLabel IBOutlet")
        XCTAssertNotNil(districtLabel)
    }
    
    func testViewController_HasregionLabel() throws {
        //helps us unwrap optional values
        let regionLabel = try XCTUnwrap(vc.regionLabel, "regionLabel IBOutlet")
        XCTAssertNotNil(regionLabel)
    }

    
    func testViewController_HasstateLabel() throws {
        //helps us unwrap optional values
        let stateLabel = try XCTUnwrap(vc.stateLabel, "stateLabel IBOutlet")
        XCTAssertNotNil(stateLabel)
    }
    
    func testViewController_HascountryLabel() throws {
        //helps us unwrap optional values
        let countryLabel = try XCTUnwrap(vc.countryLabel, "Name Label IBOutlet")
        XCTAssertNotNil(countryLabel)
    }
}
