//
//  Constants.swift
//  FindPostOffice
//
//  Created by Dharmendra Chaudhary on 30/08/22.
//

import Foundation

enum AppConstants {
    enum UserAPIEndpoint {
        private static let baseURL = "https://api.postalpincode.in"
        static func searchPostOfficeUrl(pincode:String)-> String {
            let url = baseURL + "/pincode/" + pincode
            return url
        }
    }
    
    enum testData {
        static  let validPincode = "110092"
        static  let blankPincode = "  "
        static  let invalidPincode = " 11ab"
    }
}

struct ErrorMessage {
    static let kServiceTestErrorMessage = "Find PostOffice Serivce test failed error"
    static let kRepositoryTestErrorMessage = "Find PostOffice Repository Test Failed Error"
    static let kUseCaseTestErrorMessage = "Find PostOffice Use Case Test Failed Error"
}

