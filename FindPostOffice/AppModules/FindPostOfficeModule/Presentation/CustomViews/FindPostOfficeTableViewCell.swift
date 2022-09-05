//
//  FindPostOfficeTableViewCell.swift
//  FindPostOffice
//
//  Created by Dharmendra Chaudhary on 01/09/22.
//

import UIKit

class FindPostOfficeTableViewCell: UITableViewCell {

    static var nib:UINib {
        return UINib(nibName: String(describing: self), bundle: nil)
    }
    
    static var reuseIdentifier: String {
       return String(describing: self)
    }
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var subTitleLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

}
