//
//  AssetsInteractor.swift
//  CryptoApp
//
//  Created by iveri gamezardashvili on 7/11/22.
//

import Foundation

protocol AssetsInteractorProtocol {
    func loadCoins(offset: Int) -> Void
}

final class AssetsInteractor: AssetsInteractorProtocol {
    var presenter: AssetsPresenterProtocol?
    private let service: NetworkService

    init(service: NetworkService) {
        self.service = service
    }
    
    func loadCoins(offset: Int) -> Void {
        let request = URLRequestGenerator.getCoins(offset: offset)
        service.performRequest(request, expectedData: [Coin].self) { [weak self] result in
            DispatchQueue.main.async {
                switch result {
                case let .success(data):
                    self?.presenter?.interactorDidRetriveCoins(data)
                case .failure(let error):
                    self?.presenter?.interactorDidFailRetriveCoins(error)
                }
            }
        }
    }
}
