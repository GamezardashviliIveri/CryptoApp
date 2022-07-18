//
//  DynamicColorsProvider.swift
//  CryptoApp
//
//  Created by iveri gamezardashvili on 7/18/22.
//

import UIKit

protocol DynamicColorsProviderProtocol {
    var viewBackground: DynamicColor { get }
    var highlight: DynamicColor { get }
    var cardBackground: DynamicColor { get }
    var labelColor: DynamicColor { get }
}

struct DynamicColorsProvider: DynamicColorsProviderProtocol {
    var viewBackground: DynamicColor {
        DynamicColor(
            lightColor: ColorToken.lightGreen,
            darkColor: ColorToken.darkGreen
        )
    }
    
    var highlight: DynamicColor {
        DynamicColor(
            lightColor: ColorToken.ceil,
            darkColor: ColorToken.ceil
        )
    }
    
    var cardBackground: DynamicColor {
        DynamicColor(
            lightColor: ColorToken.white,
            darkColor: ColorToken.lightBlack
        )
    }
    
    var labelColor: DynamicColor {
        DynamicColor(
            lightColor: ColorToken.black,
            darkColor: ColorToken.white
        )
    }
}
