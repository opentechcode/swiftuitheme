//
//  ThemeData.swift
//  CommercialKitchen
//
//  Created by ali on 2021-08-03.
//

import Foundation
import SwiftUI

struct ThemeData {
    var tintColor: String
    var colors: ColorData
    var textColors: TextColorData
    var images: ImageData
    var fonts: FontsData
    var textfields: TextFields
    
    init(dict: [String: Any]) {
        tintColor = dict["tintColor"] as! String
        ThemeUtil.Colors.tintColorValue = uicolorFromHex(hex: tintColor)
        colors = ColorData(dict: dict["Colors"] as! [String: Any])
        textColors = TextColorData(dict: dict["TextColors"] as! [String: Any])
        images = ImageData(dict: dict["Images"] as! [String: Any])
        fonts = FontsData(dict: dict["Fonts"] as! [String: Any])
        textfields = TextFields(dict: dict["TextFields"] as! [String: Any])
    }
}

public struct ColorData {
    var one: Color
    var two: Color
    var three: Color
    var four: Color
    var five: Color
    var six: Color
    var seven: Color
    var eight: Color
    var nine: Color
    
    init(dict: [String: Any]) {
        one = uicolorFromHex(hex: dict["one"] as? String)
        two = uicolorFromHex(hex: dict["two"] as? String)
        three = uicolorFromHex(hex: dict["three"] as? String)
        four = uicolorFromHex(hex: dict["four"] as? String)
        five = uicolorFromHex(hex: dict["five"] as? String)
        six = uicolorFromHex(hex: dict["six"] as? String)
        seven = uicolorFromHex(hex: dict["seven"] as? String)
        eight = uicolorFromHex(hex: dict["eight"] as? String)
        nine = uicolorFromHex(hex: dict["nine"] as? String)
    }
}


public struct TextColorData {
    var one: Color
    var two: Color
    var three: Color
    var four: Color
    var five: Color
    var six: Color
    var seven: Color
    var eight: Color
    var nine: Color
    var ten: Color
    var eleven: Color
    var twelve: Color
    
    init(dict: [String: Any]) {
        one = uicolorFromHex(hex: dict["one"] as? String)
        two = uicolorFromHex(hex: dict["two"] as? String)
        three = uicolorFromHex(hex: dict["three"] as? String)
        four = uicolorFromHex(hex: dict["four"] as? String)
        five = uicolorFromHex(hex: dict["five"] as? String)
        six = uicolorFromHex(hex: dict["six"] as? String)
        seven = uicolorFromHex(hex: dict["seven"] as? String)
        eight = uicolorFromHex(hex: dict["eight"] as? String)
        nine = uicolorFromHex(hex: dict["nine"] as? String)
        ten = uicolorFromHex(hex: dict["ten"] as? String)
        eleven = uicolorFromHex(hex: dict["eleven"] as? String)
        twelve = uicolorFromHex(hex: dict["twelve"] as? String)
    }
}

struct ImageData: Codable {
    var one: String
    var two: String
    var three: String
    var four: String
    
    init(dict: [String: Any]) {
        one = dict["one"] as! String
        two = dict["two"] as! String
        three = dict["one"] as! String
        four = dict["two"] as! String
    }
}

public struct FontsData: Codable {
    var LargeTitle1: FontData
    var LargeTitle2: FontData
    var Title1: FontData
    var Title2: FontData
    var Title3: FontData
    var Headline1: FontData
    var Headline2: FontData
    var Subheadline: FontData
    var Body: FontData
    var Footnote: FontData
    var Caption1: FontData
    var Caption2: FontData
    var Caption3: FontData
    var Callout: FontData
    
    init(dict: [String: Any])  {
        LargeTitle1 = FontData(dict: dict["LargeTitle1"] as! [String: Any])
        LargeTitle2 = FontData(dict: dict["LargeTitle2"] as! [String: Any])
        Title1 = FontData(dict: dict["Title1"] as! [String: Any])
        Title2 = FontData(dict: dict["Title2"] as! [String: Any])
        Title3 = FontData(dict: dict["Title3"] as! [String: Any])
        Headline1 = FontData(dict: dict["Headline1"] as! [String: Any])
        Headline2 = FontData(dict: dict["Headline2"] as! [String: Any])
        Subheadline = FontData(dict: dict["Subheadline"] as! [String: Any])
        Body = FontData(dict: dict["Body"] as! [String: Any])
        Footnote = FontData(dict: dict["Footnote"] as! [String: Any])
        Caption1 = FontData(dict: dict["Caption1"] as! [String: Any])
        Caption2 = FontData(dict: dict["Caption2"] as! [String: Any])
        Caption3 = FontData(dict: dict["Caption3"] as! [String: Any])
        Callout = FontData(dict: dict["Callout"] as! [String: Any])
    }
}

public struct FontData: Codable {
    var weight: String
    var size: Int
    var color: String
    
    init(dict: [String: Any]) {
        weight = dict["weight"] as! String
        size = dict["size"] as! Int
        color = dict["defaultColor"] as! String
    }
}


public struct TextFields {
    var one: TextFieldData
    
    init(dict: [String: Any])  {
        one  = TextFieldData(dict: dict["one"] as! [String: Any])
    }
}

public struct TextFieldData {
    var backgroundColor: Color
    var foregroundColor: Color
    
    init(dict: [String: Any]) {
        backgroundColor = uicolorFromHex(hex: dict["backgroundColor"] as? String)
        foregroundColor = uicolorFromHex(hex: dict["foregroundColor"] as? String)
    }
}


