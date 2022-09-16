//
//  FindPostOfficeDomainData.swift
//  FindPostOffice
//
//  Created by Dharmendra Chaudhary on 15/09/22.
//

import Foundation
import PromiseKit

// Domain Layer Model

struct FindPostOfficeDomainData:Codable {
    var message: String?
    var postOffices: [PostOfficeInfo]?

    
}

// MARK: - PostOfficeDetails
struct PostOfficeInfo: Codable {
    var name: String?
    var branchType, circle, district: String?
    var division, region, block, state: String?
    var country, pincode: String?

}
