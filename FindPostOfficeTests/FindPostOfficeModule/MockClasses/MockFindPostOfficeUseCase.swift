//
//  MockFindPostOfficeUseCase.swift
//  FindPostOfficeTests
//
//  Created by Dharmendra Chaudhary on 30/08/22.
//

import Foundation
import PromiseKit
@testable import FindPostOffice

class MockFindPostOfficeUseCase: FindPostOfficUseCaseProtocol {
   
    var postOffice:PostOffice?
    var error: Error?
    
    func validatePincode(for pincode: String, completion: (Bool) -> ()) {
        let pincode = pincode.trimmingCharacters(in: .whitespacesAndNewlines)
         if pincode.isInt && !pincode.isEmpty {
             completion(true)
         } else {
            completion(false)
        }
    }
    
    func GetPostOfficesList(pincode: String) -> FindPostOfficeServiceResponse {
        return Promise { promise in
            if let error = error {
                promise.reject(error)
            } else {
                if let postOffice = postOffice {
                    promise.fulfill(postOffice)
                }
            }
        }
    }

}
