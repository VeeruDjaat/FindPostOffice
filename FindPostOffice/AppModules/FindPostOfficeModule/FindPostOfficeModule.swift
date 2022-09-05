//
//  FindPostOfficeModule.swift
//  FindPostOffice
//
//  Created by Dharmendra Chaudhary on 30/08/22.
//

import Foundation
import UIKit

protocol FindPostOfficeNavigationProtocol: NavigationProtocol {
    func showDetailModule(details: PostOfficeDetails)
}

/// Builds up all the layer of FindPostOffice module.
final class FindPostOfficeModule: FindPostOfficeNavigationProtocol {
    
    // MARK: - Properties
    private let networkManager: NetworkManagerProtocol
    var navigationController: UINavigationController
    private enum Constants {
        static let nibName = "FindPostOfficeViewController"
    }

    // MARK: - Initialise
    init(networkManager:NetworkManagerProtocol, navigationController: UINavigationController) {
        self.networkManager = networkManager
        self.navigationController = navigationController
    }

    // MARK: - Methods
    func start() {
        let vc = createFindPostOfficeListViewController()
        navigationController.pushViewController(vc, animated: true)
    }
    
    //setting up FindPostOffice View Controller
    func createFindPostOfficeListViewController() -> UIViewController {
        let viewController = FindPostOfficeViewController(nibName: Constants.nibName, bundle: nil)
        viewController.viewModel = createFindPostOfficeViewModel()
        viewController.navigationDelegate = self
        viewController.viewModel?.outputDelegate = viewController
        return viewController
    }
    //injecting use case layer
    private func createFindPostOfficeViewModel() -> FindPostOfficeViewModelProtocol {
        let viewModel = FindPostOfficeViewModel(useCase: createFindPostOfficeUseCase())
        return viewModel
    }
    //injecting repository layer
    private func createFindPostOfficeUseCase() -> FindPostOfficUseCaseProtocol {
        let useCase =  FindPostOfficUseCase(repository: createFindPostOfficeRepository())
        return useCase
    }
    //injecting service layer
    private func createFindPostOfficeRepository() -> FindPostOfficeRepositoryProtocol {
        let repository = FindPostOfficeRepository(service: createFindPostOfficeService())
        return repository
    }
    // injecting network layer
    private func createFindPostOfficeService() -> FindPostOfficeServiceProtocol {
        let service = FindPostOfficeService(network: networkManager)
        return service
    }
    
    // MARK: - Navigation Methods
    func showDetailModule(details: PostOfficeDetails) {
     let detailModule = PostOfficeDetailseModule(details: details, navigationController: navigationController, networkManager: networkManager)
        detailModule.start()
    }
}
