//
//  PostOfficeDetailsViewController.swift
//  FindPostOffice
//
//  Created by Dharmendra Chaudhary on 30/08/22.
//

import UIKit

class PostOfficeDetailsViewController: UIViewController {
    
    // MARK: - Property
    @IBOutlet weak var branchLabel: UILabel!
    @IBOutlet weak var districtLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var regionLabel: UILabel!
    @IBOutlet weak var circleLabel: UILabel!
    @IBOutlet weak var stateLabel: UILabel!
    @IBOutlet weak var countryLabel: UILabel!
    
    var viewModel: PostOfficeDetailseViewModelProtocol?
    override func viewDidLoad() {
        super.viewDidLoad()
        configureView()
    }
    
    func configureView(){
        self.title = self.viewModel?.postOfficeDetails.name
        
        self.branchLabel.text = self.viewModel?.postOfficeDetails.branchType
        self.districtLabel.text = self.viewModel?.postOfficeDetails.district
        self.nameLabel.text = self.viewModel?.postOfficeDetails.name
        self.regionLabel.text = self.viewModel?.postOfficeDetails.region
        self.circleLabel.text = self.viewModel?.postOfficeDetails.circle
        self.stateLabel.text = self.viewModel?.postOfficeDetails.state
        self.countryLabel.text = self.viewModel?.postOfficeDetails.country
        
    }
    
}

