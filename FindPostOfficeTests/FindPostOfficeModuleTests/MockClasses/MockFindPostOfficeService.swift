//
//  MockFindPostOfficeService.swift
//  FindPostOfficeTests
//
//  Created by Dharmendra Chaudhary on 30/08/22.
//

import Foundation
import PromiseKit
@testable import FindPostOffice

class MockFindPostOfficeService: FindPostOfficeServiceProtocol {

    var postOffice:PostOffice?
    var error: Error?

   func makeNetworkRequest(pincode:String) -> FindPostOfficeServiceResponse {
        
        return Promise { promise in
            if let error = error {
                promise.reject(error)
            } else {
                if let postOffice = postOffice {
                    promise.fulfill(postOffice)
                } else {
                    promise.reject(NSError(domain: "com.postoffice.error", code: 1, userInfo: [NSLocalizedDescriptionKey: "No Data available"]))
                }
            }
        }
    }
}

