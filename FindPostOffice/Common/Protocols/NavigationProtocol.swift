//
//  NavigationProtocol.swift
//  FindPostOffice
//
//  Created by Dharmendra Chaudhary on 30/08/22.
//

import Foundation
import UIKit

protocol NavigationProtocol: AnyObject {
    var navigationController: UINavigationController { get set }
    func start()
}
