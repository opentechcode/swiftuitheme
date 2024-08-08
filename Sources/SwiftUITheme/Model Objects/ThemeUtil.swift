//
//  ThemeUtil.swift
//  CommercialKitchen
//
//  Created by ali on 2021-08-03.
//

import Foundation
import SwiftUI


struct ThemeUtil {
    struct Colors {
        static let pink = uicolorFromHex(hex: "ff66cc")
        static let tintColor = "tintColor"
        static var tintColorValue: Color? = nil
    }
    
    struct Prefs {
        static let ThemeStyle = "ThemeStyle"
    }
}

func uicolorFromHex(hex: String?) -> Color {
    
    guard let hex = hex else {
        return Color.gray
    }
    if hex == ThemeUtil.Colors.tintColor {
        if let tintColor = ThemeUtil.Colors.tintColorValue {
            return tintColor
        }
        return Color(red: 0.1, green: 0.4, blue: 0.5)
    }
    
    if hex.count < 6 {
        return Color.gray
    }
    var rgbValue: UInt64 = 0
    Scanner(string: hex).scanHexInt64(&rgbValue)
    
    let red = Double((rgbValue & 0xFF0000) >> 16)/256.0
    let green = Double((rgbValue & 0xFF00) >> 8)/256.0
    let blue = Double(rgbValue & 0xFF)/256.0
    let color = Color(red: red, green: green, blue: blue)
    return color
}


