//
//  FindPostOfficeViewModel.swift
//  FindPostOffice
//
//  Created by Dharmendra Chaudhary on 30/08/22.
//

import Foundation

protocol FindPostOfficeViewModelProtocol {
    var postOfficeDomainData: FindPostOfficeDomainData { get }
    func fetchPostOfficesList(pincode:String)
    var outputDelegate: FindPostOfficeViewModelOutputProtocol? { get set }
}

protocol FindPostOfficeViewModelOutputProtocol: AnyObject {
    func success()
    func errorMessage(_ error: String)
    func showLoader()
    func hideLoader()
}


final class FindPostOfficeViewModel: FindPostOfficeViewModelProtocol {
    
    // MARK: - Properties
    
    var postOfficeDomainData = FindPostOfficeDomainData()
    var outputDelegate: FindPostOfficeViewModelOutputProtocol?
    private let useCase: FindPostOfficUseCaseProtocol
    
    // MARK: - Initialise
    init(useCase: FindPostOfficUseCaseProtocol) {
        self.useCase = useCase
    }
    
    // MARK: - Methods
    
    func fetchPostOfficesList(pincode: String) {
        
        useCase.validatePincode(for: pincode) { status in
            if status {
                self.outputDelegate?.showLoader()
                useCase.getPostOfficesList(pincode: pincode).done(on: .main) { [weak self] model in
                    self?.postOfficeDomainData = model
                    self?.outputDelegate?.success()
                    self?.outputDelegate?.hideLoader()
                }
                .catch(on: .main, policy: .allErrors) { [weak self] error in
                    self?.outputDelegate?.errorMessage(error.localizedDescription)
                    self?.outputDelegate?.hideLoader()
                }
            } else {
                self.outputDelegate?.errorMessage("Please enter valid pincode")
            }
        }
                
    }
    
}

