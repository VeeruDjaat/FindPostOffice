//
//  FindPostOfficeServiceTest.swift
//  FindPostOfficeTests
//
//  Created by Dharmendra Chaudhary on 30/08/22.
//

import XCTest
@testable import FindPostOffice

class FindPostOfficeServiceTest: XCTestCase {

    var poService: FindPostOfficeService?
    let mockNetworkManager = MockFindPostOfficeNetworkManager()

    override func setUpWithError() throws {
        poService = FindPostOfficeService(network: mockNetworkManager)
    }

    func testServiceSuccess() {
        
        let expecatation = expectation(description: "Success")
        mockNetworkManager.postOffice = MockFindPostOfficeData.postOffice
        guard let poService = poService else { return }
        poService.makeNetworkRequest(pincode: AppConstants.testData.validPincode)
            .done { model in
                let postOfficeCount = model.first?.postOfficeList?.count ?? 0
                if postOfficeCount >= 1 {
                    expecatation.fulfill()
                }
            }
            .catch { _ in
                expecatation.fulfill()
            }
        wait(for: [expecatation], timeout: 1.0)
    }

    func testServiceError() {
        let expecatation = expectation(description: "Service on success case")
        mockNetworkManager.error = NSError(domain: "com.postoffice.error", code: 0, userInfo: [NSLocalizedDescriptionKey: ErrorMessage.kServiceTestErrorMessage])
        guard let poService = poService else { return }
        poService.makeNetworkRequest(pincode: AppConstants.testData.validPincode)
            .catch { _ in
                expecatation.fulfill()
            }
        wait(for: [expecatation], timeout: 1.0)
    }
}
