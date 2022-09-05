//
//  PostOfficeDetailseRepository.swift
//  PostOfficeDetailse
//
//  Created by Dharmendra Chaudhary on 30/08/22.
//

import Foundation

protocol PostOfficeDetailseRepositoryProtocol {
    
}


class PostOfficeDetailseRepository: PostOfficeDetailseRepositoryProtocol {

    private let service: PostOfficeDetailseServiceProtocol

    init(service: PostOfficeDetailseServiceProtocol) {
        self.service = service
    }

}
