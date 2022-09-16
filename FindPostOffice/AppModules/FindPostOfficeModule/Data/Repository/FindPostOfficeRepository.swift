//
//  FindPostOfficeRepository.swift
//  FindPostOffice
//
//  Created by Dharmendra Chaudhary on 30/08/22.
//

import Foundation
import PromiseKit

// This is repository class responsible for handling service and Mapping data to DomainData

class FindPostOfficeRepository: FindPostOfficeRepositoryProtocol {
   
    private let service: FindPostOfficeServiceProtocol

    init(service: FindPostOfficeServiceProtocol) {
        self.service = service
    }

    // This function getting data from service and mapping to Domain Response
    func getPostOfficesList(pincode: String) -> PostOfficeDomainResponse {
        return Promise { seal in
            service.makeNetworkRequest(pincode: pincode).done { array in
               
                if let first = array.first {
                    seal.fulfill(first.toDomain())
                }
                else {
                    seal.reject(NSError(domain: "com.postoffice.error", code: 0, userInfo: [NSLocalizedDescriptionKey: ErrorMessage.kDataMissingErrorMessage]))
                }
            }
            .catch { error in
                seal.reject(error)
            }
        }
    }
    
}
