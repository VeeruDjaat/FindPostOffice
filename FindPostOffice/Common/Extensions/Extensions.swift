//
//  Extensions.swift
//  FindPostOffice
//
//  Created by Dharmendra Chaudhary on 01/09/22.
//

import Foundation
import UIKit
import MBProgressHUD


extension UIViewController {
   func showIndicator(withTitle title: String, and Description:String) {
      let indicator = MBProgressHUD.showAdded(to: self.view, animated: true)
      indicator.label.text = title
      indicator.isUserInteractionEnabled = false
      indicator.detailsLabel.text = Description
      indicator.show(animated: true)
   }
   func hideIndicator() {
      MBProgressHUD.hide(for: self.view, animated: true)
   }
}

extension String {
    var isInt: Bool {
        return Int(self) != nil
    }
}
