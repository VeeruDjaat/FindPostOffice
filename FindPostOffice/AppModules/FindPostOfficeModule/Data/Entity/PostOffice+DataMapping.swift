//
//  PostOfficeModel.swift
//  FindPostOffice
//
//  Created by Dharmendra Chaudhary on 30/08/22.
//
// This is data model for getOffice Api
//

import Foundation

typealias PostOffice = [PostOfficeElement]

// MARK: - PostOffice
struct PostOfficeElement: Codable {
    var message, status: String?
    var postOfficeList: [PostOfficeDetails]?
    
    enum CodingKeys: String, CodingKey {
        case message = "Message"
        case status = "Status"
        case postOfficeList = "PostOffice"
    }
}

// MARK: - PostOfficeDetails

struct PostOfficeDetails: Codable {
    var name: String?
    var branchType, deliveryStatus, circle, district: String?
    var division, region, block, state: String?
    var country, pincode: String?
    
    enum CodingKeys: String, CodingKey {
        case name = "Name"
        case branchType = "BranchType"
        case deliveryStatus = "DeliveryStatus"
        case circle = "Circle"
        case district = "District"
        case division = "Division"
        case region = "Region"
        case block = "Block"
        case state = "State"
        case country = "Country"
        case pincode = "Pincode"
    }
}

extension PostOfficeElement {
    
    func toDomain() -> FindPostOfficeDomainData {
        return .init(message: message, postOffices: postOfficeList.map({ array in
            array.map { $0.toDomain()
            }
        }))
    }
    
}


extension PostOfficeDetails {
    func toDomain() -> PostOfficeInfo {
        return .init(name: name, branchType: branchType, circle: circle, district: district, division: division, region: region, block: block, state: state, country: country, pincode: pincode)
    }
    
}
