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
    func request<T>(httpMethod: httpMethod, url: URL, type: T.Type, httpBody: Data?) -> Response<T> where T : Decodable, T : Encodable {
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
    
    
    var postOffice:PostOffice?
    var error: Error?

}
