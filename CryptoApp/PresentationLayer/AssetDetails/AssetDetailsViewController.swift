//
//  AssetDetailsViewController.swift
//  CryptoApp
//
//  Created by iveri gamezardashvili on 7/12/22.
//

import UIKit

protocol AssetDetailsViewControllerProtocol: AnyObject {
    func didReachToTheEnd()
}

class AssetDetailsViewController: UIViewController, FormDataSourceViewProvider, AssetDetailsViewControllerProtocol {
    private var page = 1
    
    var interactor: AssetDetailsInteractorProtocol?
    var tableView = UITableView()
    var dynamicColorsProvider: DynamicColorsProviderProtocol?

    @IBOutlet weak var tableViewHolder: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpTablveView()
        interactor?.viewDidLoad(page: page)
    }
    
    func didReachToTheEnd() {
        page += 1
        interactor?.viewDidLoad(page: page)
    }
}

// MAKR: - Private Functions

extension AssetDetailsViewController {
    private func setUpTablveView() {
        tableViewHolder.addSubview(tableView)
        view.backgroundColor = dynamicColorsProvider?.viewBackground.uiColor
        tableView.backgroundColor = .clear
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.topAnchor.constraint(equalTo: tableViewHolder.topAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: tableViewHolder.bottomAnchor).isActive = true
        tableView.leadingAnchor.constraint(equalTo: tableViewHolder.leadingAnchor).isActive = true
        tableView.trailingAnchor.constraint(equalTo: tableViewHolder.trailingAnchor).isActive = true
        tableView.showsVerticalScrollIndicator = false
        tableView.separatorStyle = .none
    }
}
