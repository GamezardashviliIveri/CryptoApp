//
//  DynamicColor.swift
//  CryptoApp
//
//  Created by iveri gamezardashvili on 7/18/22.
//

import UIKit

protocol ColorProtocol {
    var uiColor: UIColor { get }
}

struct DynamicColor: ColorProtocol {
    let uiColor: UIColor

    init(
        lightColor: ColorToken,
        darkColor: ColorToken
    ) {
        uiColor = UIColor() { trait in
            switch trait.userInterfaceStyle {
            case .light: return lightColor.uiColor
            case .dark: return darkColor.uiColor
            default:
                return lightColor.uiColor
            }
        }
    }
}
