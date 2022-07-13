//
//  MarketResponse.swift
//  CryptoApp
//
//  Created by iveri gamezardashvili on 7/11/22.
//

import Foundation

struct Coin: Codable {
    let id: String
    let symbol: String
    let name: String
    let image: String
    let current_price: Float
    let price_change_percentage_24h: Float
    let sparkline_in_7d: Sparklines
}

struct Sparklines: Codable {
    let price: [Float]
}
