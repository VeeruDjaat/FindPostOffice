//
//  FindPostOfficeViewController.swift
//  FindPostOffice
//
//  Created by Dharmendra Chaudhary on 30/08/22.
//

import UIKit

class FindPostOfficeViewController: UIViewController, AlertProtocol {
    
    private enum Constants {
        static let screenTitle = "Search Post Office"
        static let tableViewAccessibilityIdentifier = "poTableView"
    }
    
    // MARK: - Property
    var viewModel: FindPostOfficeViewModelProtocol?
    var navigationDelegate: FindPostOfficeNavigationProtocol?
    
    @IBOutlet weak var listTableView: UITableView!
    @IBOutlet weak var messageLabel: UILabel!
    @IBOutlet weak var searchBar: UISearchBar!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = Constants.screenTitle
        registerTableViewCell()
        
        DispatchQueue.main.async { [weak self] in
            let pincode = self?.searchBar.text ?? ""
            self?.viewModel?.fetchPostOfficesList(pincode: pincode)
        }
    }
    override func viewDidAppear(_ animated: Bool) {
        
    }
    
    func registerTableViewCell(){
        self.listTableView.accessibilityIdentifier = Constants.tableViewAccessibilityIdentifier
        self.listTableView.register(FindPostOfficeTableViewCell.nib, forCellReuseIdentifier: FindPostOfficeTableViewCell.reuseIdentifier)
    }
    
    func updateView(){
        self.listTableView.reloadData()
        self.messageLabel.text = self.viewModel?.postOfficeDomainData.message
    }
    
}


extension FindPostOfficeViewController : UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.viewModel?.postOfficeDomainData.postOffices?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: FindPostOfficeTableViewCell.reuseIdentifier) as? FindPostOfficeTableViewCell {
            
            if   let details = self.viewModel?.postOfficeDomainData.postOffices?[indexPath.row] {
                cell.titleLabel.text = details.name
                cell.subTitleLabel?.text = details.district
            }
            return cell
        } else {
            return UITableViewCell()
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        if let details = self.viewModel?.postOfficeDomainData.postOffices?[indexPath.row] {
            self.navigationDelegate?.showDetailModule(details: details)
        }
    }
    
}

extension FindPostOfficeViewController : UISearchBarDelegate {
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searchBar.resignFirstResponder()
        let pincode = searchBar.text ?? ""
        viewModel?.fetchPostOfficesList(pincode: pincode)
    }
    
}

extension FindPostOfficeViewController : FindPostOfficeViewModelOutputProtocol {
    func showLoader() {
        self.showIndicator(withTitle: "Fetching List", and: "")
    }
    
    func hideLoader() {
        self.hideIndicator()
    }
    
    func success() {
        self.updateView()
    }
    
    func errorMessage(_ error: String) {
      presentAlert(message: error, on: self)
    }
    
}

