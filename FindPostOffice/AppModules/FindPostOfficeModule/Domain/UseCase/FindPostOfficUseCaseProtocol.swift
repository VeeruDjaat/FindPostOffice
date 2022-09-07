//
//  FindPostOfficUseCaseProtocol.swift
//  FindPostOffice
//
//  Created by Dharmendra Chaudhary on 07/09/22.
//

import Foundation
protocol FindPostOfficUseCaseProtocol {
    
    func validatePincode(for pincode: String, completion: (Bool) -> ())
    func GetPostOfficesList(pincode:String) -> FindPostOfficeServiceResponse
}
