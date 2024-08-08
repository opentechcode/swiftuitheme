//
//  ThemeTextColor.swift
//  CommercialKitchen
//
//  Created by ali on 2021-08-06.
//

import Foundation
import SwiftUI

public enum ThemeTextColor: String {
    ///#666666 Standard Color for text
    case one
    ///#555555 Little Darker for titles and headlines
    case two
    ///#tintColor
    case three
    ///#333333 Dark Gray Color for text
    case four
    ///#cbcbcbc Light Gray ideal for disabled colors
    case five
    ///#777777 Lightest Gray Color for text that can be used (Best for disable)
    case six
    ///#fa8072 salmon/oranges Color
    case seven
    ///#ec2526 Red Color Ideal for errors
    case eight
    ///#ffd86f Yellow
    case nine
    ///#00bfff Yellow
    case ten
    ///#ffffff white
    case eleven
    ///#000000 black
    case twelve
    
    public   var color: Color {
        switch self {
        case .one:
            return ThemeManager.shared.textColors.one
        case .two:
            return ThemeManager.shared.textColors.two
        case .three:
            return ThemeManager.shared.textColors.three
        case .four:
            return ThemeManager.shared.textColors.four
        case .five:
            return ThemeManager.shared.textColors.five
        case .six:
            return ThemeManager.shared.textColors.six
        case .seven:
            return ThemeManager.shared.textColors.seven
        case .eight:
            return ThemeManager.shared.textColors.eight
        case .nine:
            return ThemeManager.shared.textColors.nine
        case .ten:
            return ThemeManager.shared.textColors.ten
        case .eleven:
            return ThemeManager.shared.textColors.eleven
        case .twelve:
            return ThemeManager.shared.textColors.twelve
        }
    }
}

