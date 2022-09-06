//
//  PostOfficeDetailseModule.swift
//  PostOfficeDetailse
//
//  Created by Dharmendra Chaudhary on 30/08/22.
//

import Foundation
import UIKit

protocol PostOfficeDetailseNavigationProtocol: NavigationProtocol {
    
}

/// Builds up all the layer of PostOfficeDetailse module.
final class PostOfficeDetailseModule: PostOfficeDetailseNavigationProtocol {
    
    // MARK: - Properties
    var navigationController: UINavigationController
    private let networkManager: NetworkManagerProtocol
    var poDetails:PostOfficeDetails
    private enum Constants {
        static let nibName = "PostOfficeDetailsViewController"
    }

    // MARK: - Initialise
    init(details:PostOfficeDetails, navigationController: UINavigationController, networkManager:NetworkManagerProtocol) {
        self.navigationController = navigationController
        self.poDetails = details
        self.networkManager = networkManager
    }

    // MARK: - Methods
    func start() {
        let vc = createPostOfficeDetailseListViewController()
        navigationController.pushViewController(vc, animated: true)
    }
    
    //Setting up PostOfficeDetailse View Controller
    func createPostOfficeDetailseListViewController() -> UIViewController {
        let viewController = PostOfficeDetailsViewController(nibName: Constants.nibName, bundle: nil)
        viewController.viewModel = createPostOfficeDetailseViewModel()
        return viewController
    }
    //Initialising use case layer
    private func createPostOfficeDetailseViewModel() -> PostOfficeDetailseViewModelProtocol {
        let viewModel = PostOfficeDetailseViewModel( details: poDetails)
        return viewModel
    }
    
}
