//
//  FindPostOfficUseCase.swift
//  FindPostOffice
//
//  Created by Dharmendra Chaudhary on 01/09/22.
//

import Foundation


class FindPostOfficUseCase: FindPostOfficUseCaseProtocol {
   

    private let repository: FindPostOfficeRepositoryProtocol

    init(repository: FindPostOfficeRepositoryProtocol) {
        self.repository = repository
    }

    
    func getPostOfficesList(pincode: String) -> PostOfficeDomainResponse {
        return repository.getPostOfficesList(pincode: pincode)
    }

    func validatePincode(for pincode: String, completion: (Bool) -> ()) {
        
        let pincode = pincode.trimmingCharacters(in: .whitespacesAndNewlines)
        
         if pincode.isInt && !pincode.isEmpty {
             completion(true)
         } else {
            completion(false)
        }
    }
}
