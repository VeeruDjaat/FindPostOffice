//
//  PostOfficeModel.swift
//  FindPostOffice
//
//  Created by Dharmendra Chaudhary on 30/08/22.
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

