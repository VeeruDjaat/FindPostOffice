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
    
    // MARK: - Initialise
    init(details:PostOfficeDetails) {
        self.postOfficeDetails = details
    }
    
}

