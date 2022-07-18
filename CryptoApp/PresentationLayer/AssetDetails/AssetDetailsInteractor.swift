//
//  AssetDetailsInteractor.swift
//  CryptoApp
//
//  Created by iveri gamezardashvili on 7/12/22.
//

import Foundation

protocol AssetDetailsInteractorProtocol {
    func viewDidLoad(page: Int) -> Void
}

final class AssetDetailsInteractor: AssetDetailsInteractorProtocol {
    var presenter: AssetDetailsPresenterProtocol?
    private var coins = [Coin]()
    private let service: NetworkService

    init(service: NetworkService) {
        self.service = service
    }
    
    func viewDidLoad(page: Int) -> Void {
        let request = URLRequestGenerator.getCoins(offset: 0, sortingType: .market, page: page)
        service.performRequest(request, expectedData: [Coin].self) { [weak self] result in
            DispatchQueue.main.async {
                switch result {
                case let .success(data):
                    self?.coins.append(contentsOf: data)
                    self?.presenter?.viewDidLoad(coins: self?.coins ?? [])
                case .failure(let error):
                    self?.presenter?.interactorDidFailRetriveCoins(error: error)
                }
            }
        }
    }
}
