//
//  FindPostOfficUseCase.swift
//  FindPostOffice
//
//  Created by Dharmendra Chaudhary on 01/09/22.
//

import Foundation


protocol FindPostOfficUseCaseProtocol {
    func GetPostOfficesList(pincode:String) -> FindPostOfficeServiceResponse
}

class FindPostOfficUseCase: FindPostOfficUseCaseProtocol {

    private let repository: FindPostOfficeRepositoryProtocol

    init(repository: FindPostOfficeRepositoryProtocol) {
        self.repository = repository
    }

    func GetPostOfficesList(pincode:String) -> FindPostOfficeServiceResponse {
        return repository.callServiceToGetPostOfficesList(pincode:pincode)
    }
    
}
