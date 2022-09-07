//
//  FindPostOfficeUseCaseTest.swift
//  FindPostOfficeTests
//
//  Created by Dharmendra Chaudhary on 30/08/22.
//

import XCTest
@testable import FindPostOffice

class FindPostOfficeUseCaseTest: XCTestCase {

    var useCase: FindPostOfficUseCase?
    let repository = MockFindPostOfficeRepository()

    override func setUpWithError() throws {
        useCase = FindPostOfficUseCase(repository: repository)
    }
    
    
    func testPincodeValidationSuccess() {
        let expecatation = expectation(description: "Success")

        guard let useCase = useCase else { return }
        useCase.validatePincode(for: AppConstants.testData.validPincode) { status in
            if status {
                expecatation.fulfill()
            }
        }
        wait(for: [expecatation], timeout: 1.0)
    }
    
    func testPincodeValidationFailure() {
        let expecatation = expectation(description: "Success")

        guard let useCase = useCase else { return }
        useCase.validatePincode(for: AppConstants.testData.blankPincode) { status in
            if !status {
                expecatation.fulfill()
            }
        }
        wait(for: [expecatation], timeout: 1.0)
    }

    func testUseCaseGetOfficeListSuccess() {
        let expecatation = expectation(description: "Success")
        repository.postOffice = MockFindPostOfficeData.postOffice
        guard let useCase = useCase else { return }
        useCase.GetPostOfficesList(pincode: AppConstants.testData.validPincode)
            .done { model in
                let postOfficeCount = model.first?.postOfficeList?.count ?? 0
                if postOfficeCount >= 1 {
                    expecatation.fulfill()
                }
            }
            .catch { _ in }

        wait(for: [expecatation], timeout: 1.0)
    }

    func testUseCaseGetOfficeListFailure() {

        let expecatation = expectation(description: "Failure")
        repository.error = NSError(domain: "com.postoffice.error", code: 0, userInfo: [NSLocalizedDescriptionKey: ErrorMessage.kUseCaseTestErrorMessage])
        guard let useCase = useCase else { return }
        useCase.GetPostOfficesList(pincode: AppConstants.testData.validPincode)
            .catch { error in
                XCTAssertTrue(error.localizedDescription == ErrorMessage.kUseCaseTestErrorMessage)
                expecatation.fulfill()
            }

        wait(for: [expecatation], timeout: 1.0)
    }
}
