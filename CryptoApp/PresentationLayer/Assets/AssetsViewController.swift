//
//  AssetsViewController.swift
//  CryptoApp
//
//  Created by iveri gamezardashvili on 7/11/22.
//

import UIKit

protocol AssetsViewControllerProtocol: AnyObject {}

final class AssetsViewController: UIViewController, FormDataSourceViewProvider, AssetsViewControllerProtocol {
    @IBOutlet weak var sortingButtonsHolderVIew: UIView!
    @IBOutlet weak var topView: UIView!
    @IBOutlet weak var marketCapView: UIView!
    @IBOutlet weak var volumeView: UIView!
    @IBOutlet weak var nameView: UIView!
    
    var interactor: AssetsInteractorProtocol?
    var router: AssetsRouterProtocol?
    var dynamicColorsProvider: DynamicColorsProviderProtocol?

    var tableView = UITableView()
    private var currentSortingType = SortingType.market
    private var bottomReachedSortingType = SortingType.none
    private var page = 1
    
    @IBOutlet private var tableViewHolder: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpView()
        setUpTablveView()
        interactor?.loadCoins(offset: 0, sortingType: .market, page: 1)
    }
    
    func didReachToTheBottom() {
        page = currentSortingType == bottomReachedSortingType ? (page + 1) : 2
        bottomReachedSortingType = currentSortingType
        interactor?.loadCoins(offset: 0, sortingType: currentSortingType, page: page)
    }
    
    @IBAction private func didSelectMarketCap(_ sender: Any) {
        guard currentSortingType != .market else { return }
        marketCapView.backgroundColor = dynamicColorsProvider?.highlight.uiColor
        volumeView.backgroundColor = .clear
        nameView.backgroundColor = .clear
        currentSortingType = .market
        bottomReachedSortingType = .none
        interactor?.loadCoins(offset: 0, sortingType: .market, page: 1)
    }
    
    @IBAction private func didSelectVolume(_ sender: Any) {
        guard currentSortingType != .volume else { return }
        marketCapView.backgroundColor = .clear
        volumeView.backgroundColor = dynamicColorsProvider?.highlight.uiColor
        nameView.backgroundColor = .clear
        currentSortingType = .volume
        bottomReachedSortingType = .none
        interactor?.loadCoins(offset: 0, sortingType: .volume, page: 1)
    }
    
    @IBAction private func didSelectName(_ sender: Any) {
        guard currentSortingType != .name else { return }
        marketCapView.backgroundColor = .clear
        volumeView.backgroundColor = .clear
        nameView.backgroundColor = dynamicColorsProvider?.highlight.uiColor
        currentSortingType = .name
        bottomReachedSortingType = .none
        interactor?.loadCoins(offset: 0, sortingType: .name, page: 1)
    }
}

// MAKR: - Private Functions

extension AssetsViewController {
    private func setUpView() {
        title = "Market"
        view.backgroundColor = dynamicColorsProvider?.viewBackground.uiColor
        sortingButtonsHolderVIew.backgroundColor = dynamicColorsProvider?.cardBackground.uiColor
        topView.backgroundColor = dynamicColorsProvider?.cardBackground.uiColor
        marketCapView.layer.cornerRadius = 8
        volumeView.layer.cornerRadius = 8
        nameView.layer.cornerRadius = 8
    }
    
    private func setUpTablveView() {
        tableViewHolder.addSubview(tableView)
        tableView.backgroundColor = .clear
        tableView.contentInset = UIEdgeInsets(top: 16, left: 0, bottom: 20, right: 0)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.topAnchor.constraint(equalTo: tableViewHolder.topAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: tableViewHolder.bottomAnchor).isActive = true
        tableView.leadingAnchor.constraint(equalTo: tableViewHolder.leadingAnchor).isActive = true
        tableView.trailingAnchor.constraint(equalTo: tableViewHolder.trailingAnchor).isActive = true
        tableView.showsVerticalScrollIndicator = false
        tableView.separatorStyle = .none
    }
}
