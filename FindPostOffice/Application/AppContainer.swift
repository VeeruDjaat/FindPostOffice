//
//  AppContainer.swift
//  FindPostOffice
//
//  Created by Dharmendra Chaudhary on 30/08/22.
//

import Foundation
import UIKit

final class AppContainer {
    
    lazy var networkManager: NetworkManagerProtocol = {
       let networkManager = NetworkManger()
        return networkManager
    }()

    func startApp(on window: UIWindow?) {
        let navigationController = UINavigationController()
        window?.rootViewController = navigationController
        window?.makeKeyAndVisible()
        let module = FindPostOfficeModule(networkManager: networkManager, navigationController: navigationController)
        module.start()
    }
}
