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
      let Indicator = MBProgressHUD.showAdded(to: self.view, animated: true)
      Indicator.label.text = title
      Indicator.isUserInteractionEnabled = false
      Indicator.detailsLabel.text = Description
      Indicator.show(animated: true)
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
