//
//  AssetsInteractor.swift
//  CryptoApp
//
//  Created by iveri gamezardashvili on 7/11/22.
//

import Foundation

protocol AssetsInteractorProtocol {
    func loadCoins(offset: Int, sortingType: SortingType, page: Int) -> Void
}

final class AssetsInteractor: AssetsInteractorProtocol {
    var presenter: AssetsPresenterProtocol?
    private let service: NetworkService
    private var coinsWithMarketCap = [Coin]()
    private var coinsWithVolume = [Coin]()
    private var coinsWithName = [Coin]()

    init(service: NetworkService) {
        self.service = service
    }
    
    func loadCoins(offset: Int, sortingType: SortingType, page: Int) -> Void {
        let request = URLRequestGenerator.getCoins(offset: offset, sortingType: sortingType, page: page)
        service.performRequest(request, expectedData: [Coin].self) { [weak self] result in
            DispatchQueue.main.async { [weak self] in
                switch result {
                case let .success(data):
                    switch sortingType {
                    case .market:
                        self?.coinsWithVolume = []
                        self?.coinsWithName = []
                        self?.coinsWithMarketCap.append(contentsOf: data)
                        self?.presenter?.interactorDidRetriveCoins(
                            self?.coinsWithMarketCap ?? [],
                            shouldScrollToTop: page == 1 ? true : false)
                    case .volume:
                        self?.coinsWithMarketCap = []
                        self?.coinsWithName = []
                        self?.coinsWithVolume.append(contentsOf: data)
                        self?.presenter?.interactorDidRetriveCoins(self?.coinsWithVolume ?? [], shouldScrollToTop: page == 1 ? true : false)
                    case .name:
                        self?.coinsWithMarketCap = []
                        self?.coinsWithVolume = []
                        self?.coinsWithName.append(contentsOf: data)
                        self?.presenter?.interactorDidRetriveCoins(self?.coinsWithName ?? [], shouldScrollToTop: page == 1 ? true : false)
                    case .none:
                        break
                    }
                case .failure(let error):
                    self?.presenter?.interactorDidFailRetriveCoins(error)
                }
            }
        }
    }
}
