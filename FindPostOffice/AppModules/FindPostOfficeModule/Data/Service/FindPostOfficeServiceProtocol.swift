//
//  FindPostOfficeServiceProtocol.swift
//  FindPostOffice
//
//  Created by Dharmendra Chaudhary on 07/09/22.
//

import Foundation


protocol FindPostOfficeServiceProtocol {
    func makeNetworkRequest(pincode:String) -> FindPostOfficeServiceResponse
}
