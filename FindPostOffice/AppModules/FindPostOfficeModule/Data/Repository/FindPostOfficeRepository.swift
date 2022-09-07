//
//  FindPostOfficeRepository.swift
//  FindPostOffice
//
//  Created by Dharmendra Chaudhary on 30/08/22.
//

import Foundation


class FindPostOfficeRepository: FindPostOfficeRepositoryProtocol {

    private let service: FindPostOfficeServiceProtocol

    init(service: FindPostOfficeServiceProtocol) {
        self.service = service
    }

    func callServiceToGetPostOfficesList(pincode:String) -> FindPostOfficeServiceResponse {
        return service.makeNetworkRequest(pincode:pincode)
    }
}
