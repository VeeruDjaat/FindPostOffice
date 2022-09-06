//
//  FindPostOfficeViewModelTest.swift
//  FindPostOfficeTests
//
//  Created by Dharmendra Chaudhary on 30/08/22.
//

import XCTest
@testable import FindPostOffice

class FindPostOfficeViewModelTest: XCTestCase {

    var viewModel: FindPostOfficeViewModel?
    var useCase =  MockFindPostOfficeUseCase()
    var expecatation: XCTestExpectation!

    override func setUpWithError() throws {
        viewModel = FindPostOfficeViewModel(useCase: useCase)
        viewModel?.outputDelegate = self
    }

    func testViewModelSuccess() {
        expecatation = expectation(description: "Success")
        useCase.postOffice = MockFindPostOfficeData.postOffice
        viewModel?.fetchPostOfficesList(pincode: AppConstants.testData.validPincode)
        wait(for: [expecatation], timeout: 3.0)
    }

    func testViewModelFailure() {
        expecatation = expectation(description: "Should get fail")
        useCase.error = NSError(domain: "com.postoffice.error", code: 0, userInfo: [NSLocalizedDescriptionKey: "Failed Error"])
        viewModel?.fetchPostOfficesList(pincode: AppConstants.testData.validPincode)
        wait(for: [expecatation], timeout: 3.0)
    }
}

extension FindPostOfficeViewModelTest: FindPostOfficeViewModelOutputProtocol {

    func success() {
        expecatation.fulfill()
    }

    func errorMessage(_ error: String) {
        XCTAssertTrue(error == "Failed Error")
        expecatation.fulfill()
    }
    
    func showLoader() {
        print("show")
    }
    func hideLoader(){
        print("hide")
    }
    
}
