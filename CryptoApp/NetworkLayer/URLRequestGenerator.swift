//
//  URLRequestGenerator.swift
//  CryptoApp
//
//  Created by iveri gamezardashvili on 7/11/22.
//

import Foundation

enum URLs {
    private static let baseUrl = URL(string: "https://api.coingecko.com/api/v3")!
    static let getCoins = baseUrl.appendingPathComponent("/coins/markets")
}

struct URLRequestGenerator {
    static func getCoins(offset: Int) -> URLRequest {
        let queryItems = [
            URLQueryItem(name: "vs_currency", value: "usd"),
            URLQueryItem(name: "order", value: "market_cap_desc"),
            URLQueryItem(name: "per_page", value: "100"),
            URLQueryItem(name: "page", value: "1"),
            URLQueryItem(name: "sparkline", value: "true")
        ]

        var urlComps = URLComponents(url: URLs.getCoins, resolvingAgainstBaseURL: false)!
        urlComps.queryItems = queryItems
        
        return URLRequest(url: urlComps.url!)
    }
}
