//
//  MockFindPostOfficeNetworkManager.swift
//  FindPostOfficeTests
//
//  Created by Dharmendra Chaudhary on 30/08/22.
//

import Foundation
import PromiseKit
@testable import FindPostOffice

class MockFindPostOfficeNetworkManager: NetworkManagerProtocol {
    
    var postOffice:PostOffice?
    var error: Error?

    func request<T: Codable>(_ type: T.Type, endPoint: URL) -> Response<T> {
        return Promise { promise in
            if let error = error {
                promise.reject(error)
            } else {
                if let postOffice = postOffice {
                    promise.fulfill(postOffice as! T)
                } else {
                    promise.reject(NSError(domain: "com.postoffice.error", code: 1, userInfo: [NSLocalizedDescriptionKey: "No Data available"]))
                }
            }
        }
    }
}
