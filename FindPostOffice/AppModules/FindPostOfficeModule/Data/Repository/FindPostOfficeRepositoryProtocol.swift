//
//  FindPostOfficeRepositoryProtocol.swift
//  FindPostOffice
//
//  Created by Dharmendra Chaudhary on 07/09/22.
//

import Foundation
import PromiseKit

typealias PostOfficeDomainResponse = Promise<FindPostOfficeDomainData>

//Repository Protocol
protocol FindPostOfficeRepositoryProtocol {
    func getPostOfficesList(pincode: String) -> PostOfficeDomainResponse

}
