//
//  Alertable.swift
//  FindPostOffice
//
//  Created by Dharmendra Chaudhary on 05/09/22.
//

import UIKit

protocol AlertProtocol {
    func presentAlert(title: String?, message: String?, on controller: UIViewController)
}

extension AlertProtocol{
    func presentAlert(title: String? = nil, message: String?, on controller: UIViewController) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .cancel))
        DispatchQueue.main.async {
            alert.view.accessibilityIdentifier = "errorAlertDialog"
            controller.present(alert, animated: true)
        }
    }
}
