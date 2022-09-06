//
//  FindPostOfficUseCase.swift
//  FindPostOffice
//
//  Created by Dharmendra Chaudhary on 01/09/22.
//

import Foundation


protocol FindPostOfficUseCaseProtocol {
    
    func validatePincode(for pincode: String, completion: (Bool) -> ())
    func GetPostOfficesList(pincode:String) -> FindPostOfficeServiceResponse
}

class FindPostOfficUseCase: FindPostOfficUseCaseProtocol {
   
    func validatePincode(for pincode: String, completion: (Bool) -> ()) {
        
        let pincode = pincode.trimmingCharacters(in: .whitespacesAndNewlines)
        
         if pincode.isInt && !pincode.isEmpty {
             completion(true)
         } else {
            completion(false)
        }
    }
    

    private let repository: FindPostOfficeRepositoryProtocol

    init(repository: FindPostOfficeRepositoryProtocol) {
        self.repository = repository
    }

    func GetPostOfficesList(pincode:String) -> FindPostOfficeServiceResponse {
        return repository.callServiceToGetPostOfficesList(pincode:pincode)
    }
    
}
