//
//  AssetsViewController.swift
//  CryptoApp
//
//  Created by iveri gamezardashvili on 7/11/22.
//

import UIKit

protocol AssetsViewControllerProtocol: AnyObject {
    func setUp(
        interactor: AssetsInteractorProtocol,
        router: AssetsRouterProtocol,
        delegate: FormDelegateProtocol,
        dataSource: FormDataSourceProtocol
    )
}

final class AssetsViewController: UIViewController, FormDataSourceViewProvider {
    var interactor: AssetsInteractorProtocol?
    var router: AssetsRouterProtocol?

    var tableView = UITableView()
    
    @IBOutlet private var tableViewHolder: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpView()
        setUpTablveView()
        interactor?.loadCoins(offset: 0)
    }
    
    func setUp(
        interactor: AssetsInteractorProtocol,
        router: AssetsRouterProtocol
    ) {
        self.interactor = interactor
        self.router = router
    }
}

// MAKR: - Private Functions

extension AssetsViewController {
    private func setUpView() {
        title = "Market"
    }
    
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
