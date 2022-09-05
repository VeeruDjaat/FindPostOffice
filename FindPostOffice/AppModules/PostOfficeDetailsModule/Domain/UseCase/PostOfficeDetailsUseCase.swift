//
//  PostOfficeDetailsUseCase.swift
//  PostOfficeDetailse
//
//  Created by Dharmendra Chaudhary on 01/09/22.
//

import Foundation


protocol PostOfficeDetailsUseCaseProtocol {
    
}

class PostOfficeDetailsUseCase: PostOfficeDetailsUseCaseProtocol {

    private let repository: PostOfficeDetailseRepositoryProtocol

    init(repository: PostOfficeDetailseRepositoryProtocol) {
        self.repository = repository
    }

    
}
