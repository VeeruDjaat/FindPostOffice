//
//  FindPostOfficeService.swift
//  FindPostOffice
//
//  Created by Dharmendra Chaudhary on 30/08/22.
//

import Foundation
import PromiseKit


protocol FindPostOfficeServiceProtocol {
    func makeNetworkRequest(pincode:String) -> FindPostOfficeServiceResponse
}

class FindPostOfficeService: FindPostOfficeServiceProtocol {

    private let network: NetworkManagerProtocol

    init(network: NetworkManagerProtocol) {
        self.network = network
    }
    
    func makeNetworkRequest(pincode:String) -> FindPostOfficeServiceResponse {
        let endPoint = AppConstants.UserAPIEndpoint.searchPostOfficeUrl(pincode: pincode)
        let url = URL(string: endPoint)
        guard let url = url else { return Promise.value([]) }
        let serviceResponse = network.request([PostOfficeElement].self, endPoint: url)
        return serviceResponse
    }
}
