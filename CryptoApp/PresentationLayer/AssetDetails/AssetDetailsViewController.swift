//
//  AssetDetailsViewController.swift
//  CryptoApp
//
//  Created by iveri gamezardashvili on 7/12/22.
//

import UIKit

protocol AssetDetailsViewControllerProtocol: AnyObject {}

class AssetDetailsViewController: UIViewController, FormDataSourceViewProvider, AssetDetailsViewControllerProtocol {
    var interactor: AssetDetailsInteractorProtocol?

    var tableView = UITableView()
    
    @IBOutlet weak var tableViewHolder: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpTablveView()
        interactor?.viewDidLoad()
    }
}

// MAKR: - Private Functions

extension AssetDetailsViewController {
    private func setUpTablveView() {
        tableViewHolder.addSubview(tableView)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.topAnchor.constraint(equalTo: tableViewHolder.topAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: tableViewHolder.bottomAnchor).isActive = true
        tableView.leadingAnchor.constraint(equalTo: tableViewHolder.leadingAnchor).isActive = true
        tableView.trailingAnchor.constraint(equalTo: tableViewHolder.trailingAnchor).isActive = true
        tableView.showsVerticalScrollIndicator = false
        tableView.separatorStyle = .none
    }
}
