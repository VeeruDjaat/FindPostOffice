//
//  PostOfficeDetailseViewModel.swift
//  PostOfficeDetailse
//
//  Created by Dharmendra Chaudhary on 30/08/22.
//

import Foundation

protocol PostOfficeDetailseViewModelProtocol {
    var postOfficeDetails: PostOfficeDetails { get }
}


final class PostOfficeDetailseViewModel: PostOfficeDetailseViewModelProtocol {
    
    
    // MARK: - Properties
    var postOfficeDetails: PostOfficeDetails
    private let useCase: PostOfficeDetailsUseCaseProtocol
    
    // MARK: - Initialise
    init(useCase: PostOfficeDetailsUseCaseProtocol,details:PostOfficeDetails) {
        self.useCase = useCase
        self.postOfficeDetails = details
    }
    
}

