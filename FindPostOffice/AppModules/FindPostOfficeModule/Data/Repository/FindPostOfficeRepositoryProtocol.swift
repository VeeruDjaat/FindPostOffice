//
//  FindPostOfficeRepositoryProtocol.swift
//  FindPostOffice
//
//  Created by Dharmendra Chaudhary on 07/09/22.
//

import Foundation

protocol FindPostOfficeRepositoryProtocol {
    func callServiceToGetPostOfficesList(pincode:String) -> FindPostOfficeServiceResponse
}
