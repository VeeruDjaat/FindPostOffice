//
//  FindOfficeRepositoryTest.swift
//  FindPostOfficeTests
//
//  Created by Dharmendra Chaudhary on 30/08/22.
//

import XCTest
@testable import FindPostOffice

class FindOfficeRepositoryTest: XCTestCase {
    
    var findPORepository: FindPostOfficeRepository?
    let mockService = MockFindPostOfficeService()
    
    override func setUpWithError() throws {
        findPORepository = FindPostOfficeRepository(service: mockService)
    }
    
    func testRepositorySuccess() {
        let expecatation = expectation(description: "Success")
        mockService.postOffice = MockFindPostOfficeData.postOffice
        guard let findPORepository = findPORepository else { return }
        
        findPORepository.getPostOfficesList(pincode: AppConstants.testData.validPincode)
            .done { model in
                let postOfficeCount = model.postOffices?.count ?? 0
                if postOfficeCount >= 1 {
                    expecatation.fulfill()
                }
            }
            .catch { _ in
                expecatation.fulfill()
            }
        
        wait(for: [expecatation], timeout: 3.0)
    }
    
    func testRepositoryFailure() {
        let expecatation = expectation(description: "Failure")
        mockService.error = NSError(domain: "com.postoffice.error", code: 0, userInfo: [NSLocalizedDescriptionKey: ErrorMessage.kRepositoryTestErrorMessage])
        guard let findPORepository = findPORepository else { return }
        findPORepository.getPostOfficesList(pincode: AppConstants.testData.validPincode)
            .catch {error in
                XCTAssertTrue(error.localizedDescription == ErrorMessage.kRepositoryTestErrorMessage)
                expecatation.fulfill()
            }
        
        wait(for: [expecatation], timeout: 1.0)
    }
}
