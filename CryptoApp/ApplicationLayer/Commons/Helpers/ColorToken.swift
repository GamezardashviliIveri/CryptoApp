//
//  ColorToken.swift
//  CryptoApp
//
//  Created by iveri gamezardashvili on 7/18/22.
//

import UIKit

struct ColorToken {
    let hex: Int
    let uiColor: UIColor

    init(hex: Int) {
        self.hex = hex
        uiColor = UIColor(hexValue: hex)
    }
    
    static let lightGreen = ColorToken(hex: 0xD0DEDD)
    static let darkGreen = ColorToken(hex: 0x141b29)
    static let ceil = ColorToken(hex: 0x00BDB0)
    static let black = ColorToken(hex: 0x000000)
    static let lightBlack = ColorToken(hex: 0x484D58)
    static let white = ColorToken(hex: 0xFFFFFF)
}
