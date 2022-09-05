//
//  PostOfficeDetailseService.swift
//  PostOfficeDetailse
//
//  Created by Dharmendra Chaudhary on 30/08/22.
//

import Foundation
import PromiseKit


protocol PostOfficeDetailseServiceProtocol {
    
}

class PostOfficeDetailseService: PostOfficeDetailseServiceProtocol {

    private let network: NetworkManagerProtocol

    init(network: NetworkManagerProtocol) {
        self.network = network
    }
    
}
