//
//  PostOfficeDetailseViewModel.swift
//  PostOfficeDetailse
//
//  Created by Dharmendra Chaudhary on 30/08/22.
//

import Foundation

protocol PostOfficeDetailseViewModelProtocol {
    var postOfficeDetails: PostOfficeInfo { get }
}


final class PostOfficeDetailseViewModel: PostOfficeDetailseViewModelProtocol {
    
    
    // MARK: - Properties
    var postOfficeDetails: PostOfficeInfo
    
    // MARK: - Initialise
    init(details:PostOfficeInfo) {
        self.postOfficeDetails = details
    }
    
}

