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

    func testUseCase_Success() {
        let expecatation = expectation(description: "Success")

        repository.callServiceToGetPostOfficesList(pincode:"110092") = MockFindPostOfficeData.FindPostOffice
        guard let useCase = useCase else { return }
        useCase.getFindPostOffices()
            .done { model in
                let FindPostOfficeCount = model.count
                if FindPostOfficeCount >= 1 {
                    expecatation.fulfill()
                }
            }
            .catch { _ in }

        wait(for: [expecatation], timeout: 1.0)
    }

    func testUseCase_Failure() {
        let expecatation = expectation(description: "Failure")
        repository.error = NSError(domain: "com.example.error", code: 0, userInfo: [NSLocalizedDescriptionKey: ErrorMessage.kUseCaseFailedErrorMessage])
        guard let useCase = useCase else { return }
        useCase.getFindPostOffices()
            .catch { error in
                XCTAssertTrue(error.localizedDescription == ErrorMessage.kUseCaseFailedErrorMessage)
                expecatation.fulfill()
            }

        wait(for: [expecatation], timeout: 1.0)
    }
}
