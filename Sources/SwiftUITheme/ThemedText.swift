//
//  ThemedText.swift
//  CommercialKitchen
//
//  Created by ali on 2021-07-12.
//

import SwiftUI

public enum TextStyle: String {
    /// System Regular 34
    case largeTitle
    /// System Regular 28
    case title1
    /// System Regular 22
    case title2
    /// System Regular 20
    case title3
    /// System Semi Bold 17
    case headline
    /// System Regular 17
    case body
    /// System Regular 16
    case callout
    /// System Regular 15
    case subheadline
    /// System Regular 13
    case footnote
    /// System Regular 12
    case caption1
    /// System Regular 11
    case caption2
}

public struct ThemedText: View {
    
    public var text: String
    public var textStyle: TextStyle = .body
    public var textColor: ThemeTextColor = .one
    
    public init(text: String, textStyle: TextStyle = .body, textColor: ThemeTextColor = .one) {
        self.text = text
        self.textStyle = textStyle
        self.textColor = textColor
    }
    
    public var body: some View {
        
        makeBody()
    }
    
    func makeBody() -> some View {
        var makeText: Text
        switch textStyle {
        case .largeTitle:
            makeText = Text(text).font(.largeTitle)
        case .title1:
            makeText = Text(text).font(.title)
        case .title2:
            makeText = Text(text).font(.title2)
        case .title3:
            makeText = Text(text).font(.title3)
        case .headline:
            makeText = Text(text).font(.headline)
        case .subheadline:
            makeText = Text(text).font(.subheadline)
        case .body:
            makeText = Text(text).font(.body).bold()
        case .callout:
            makeText = Text(text).font(.callout).bold()
        case .footnote:
            makeText = Text(text).font(.footnote)
        case .caption1:
            makeText = Text(text).font(.caption)
        case .caption2:
            makeText = Text(text).font(.caption2)
        }
        makeText = makeText.foregroundColor(textColor.color)
        return makeText
    }
}

struct ThemedText_Previews: PreviewProvider {
    static var previews: some View {
        ThemedText(text: "Test", textColor: .twelve)
    }
}
