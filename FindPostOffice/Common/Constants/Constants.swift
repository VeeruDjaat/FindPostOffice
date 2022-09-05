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
    
}

struct ErrorMessage {
//    static let kServiceFailedErrorMeesage = "Follower serivce failed error"
//    static let kRepositoryFailedErrorMessage = "Repository Failed Error"
//    static let kUseCaseFailedErrorMessage = "Use Case Failed Error"
}

