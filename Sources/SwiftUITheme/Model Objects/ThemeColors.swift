//
//  ThemeColors.swift
//  CommercialKitchen
//
//  Created by ali on 2021-08-04.
//

import Foundation
import SwiftUI

public enum ThemeColor: String {
    ///ffffff white color
    case one
    ///f9f9f9 slight gray, mostky white color
    case two
    ///tintColor color
    case three
    ///ec2526 red color
    case four
    ///cbcbcb dark gray color
    case five
    ///a7a9ac light gray
    case six
    ///666666 gray
    case seven
    ///333333 middle gray
    case eight
    ////ffd86f
    case nine
    
    public var color: Color {
        switch self {
        case .one:
            return ThemeManager.shared.colorsData.one
        case .two:
            return ThemeManager.shared.colorsData.two
        case .three:
            return ThemeManager.shared.colorsData.three
        case .four:
            return ThemeManager.shared.colorsData.four
        case .five:
            return ThemeManager.shared.colorsData.five
        case .six:
            return ThemeManager.shared.colorsData.six
        case .seven:
            return ThemeManager.shared.colorsData.seven
        case .eight:
            return ThemeManager.shared.colorsData.eight
        case .nine:
            return ThemeManager.shared.colorsData.nine
        }
    }
    
}
