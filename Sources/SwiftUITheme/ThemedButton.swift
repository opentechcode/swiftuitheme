//
//  ThemedButton.swift
//  CommercialKitchen
//
//  Created by ali on 2021-08-06.
//

import SwiftUI

public enum ButtonThemeStyle: String {
    /// Simple Text Button
    case one
    /// Button with rounded border
    case two
    /// Rounded border with clear background
    case three
    /// Circular Button
    case four
    /// Circular Bordered Button
    case five
    /// Icon with image at bottom
    case six
}

public struct ThemedRegularButtonView: View {
    public var text: String?
    public var action: (()-> Void)?
    
    public init(text: String, action: (()-> Void)?) {
        self.text = text
        self.action = action
    }
    
    public var body: some View {
        ThemedButton(style: ButtonThemeStyle.two, text: text, roundCorner: false,
                     textStyle: .title3, textColorTheme: .eleven, pressedTextColorTheme: .twelve,
                     backgroundColorTheme: .three, pressedBackgroundColorTheme: .five,
                     maxWidth: .infinity, maxHeight: 25.0) {
            action?()
        }
    }
}


public struct ThemedGoogleButtonView: View {
    public var text: String?
    public var action: (()-> Void)?
    
    public init(text: String, action: (()-> Void)?) {
        self.text = text
        self.action = action
    }
    
    public var body: some View {
        ThemedButton(style: ButtonThemeStyle.two, text: text, roundCorner: false,
                     textStyle: .title3, textColorTheme: .eleven, pressedTextColorTheme: .twelve,
                     backgroundColorTheme: .four, pressedBackgroundColorTheme: .five,
                     maxWidth: .infinity, maxHeight: 25.0) {
            action?()
        }
                     
    }
}

public struct ThemedButton: View {
    
    public var style: ButtonThemeStyle = .two
    public var action: (()-> Void)?
    public var roundCorner: Bool = false
    public var text: String?
    public var imageName: String?
    public var systemImage: String?
    public var imageTintColor: Color?
    public var textStyle: TextStyle
    public var textColorTheme: ThemeTextColor?// = .eleven
    public var pressedTextColorTheme: ThemeTextColor?// = .eleven
    public var backgroundColorTheme: ThemeColor? // = .three
    public var pressedBackgroundColorTheme: ThemeColor?
    public var maxWidth: CGFloat?
    public var maxHeight: CGFloat?
    public var width: CGFloat?
    public var height: CGFloat?
    public var paddingLeading: CGFloat?
    public var paddingTrailing: CGFloat?
    public var paddingTop: CGFloat?
    public var paddingBottom: CGFloat?
    
    public var body: some View {
        VStack {
            switch style {
            case .one:
                makeTextButton()
            case .two:
                makeRoundCornerButton()
            case .three:
                makeBorderedRoundCornerButton()
            case .four:
                makeCircularButton()
            case .five:
                makeCircularBorderButton()
            case .six:
                makeIconImage()
            }
        }
        //devMode()
    }
    
    public init(style: ButtonThemeStyle = .two, text: String? = nil,
                roundCorner: Bool = false,
                imageName: String? = nil, systemImage: String? = nil,
                imageTintColor: Color? = nil,
                textStyle: TextStyle = .body,
                textColorTheme: ThemeTextColor? = nil,
                pressedTextColorTheme: ThemeTextColor? = nil,
                backgroundColorTheme: ThemeColor? = nil,
                pressedBackgroundColorTheme: ThemeColor? = nil,
                width: CGFloat? = nil, height: CGFloat? = nil,
                maxWidth: CGFloat? = nil, maxHeight: CGFloat? = nil,
                paddingLeading: CGFloat? = nil, paddingTrailing: CGFloat? = nil,
                paddingTop: CGFloat? = nil, paddingBottom: CGFloat? = nil,
                action: (() -> Void)? = nil) {
        self.style = style
        self.action = action
        self.text = text
        self.roundCorner = roundCorner
        self.imageName = imageName
        self.systemImage = systemImage
        self.imageTintColor = imageTintColor
        self.textStyle = textStyle
        self.textColorTheme = textColorTheme
        self.pressedTextColorTheme = pressedTextColorTheme
        self.backgroundColorTheme = backgroundColorTheme
        self.pressedBackgroundColorTheme = pressedBackgroundColorTheme
        self.width = width
        self.height = height
        self.maxWidth = maxWidth
        self.maxHeight = maxHeight
        self.paddingLeading = paddingLeading
        self.paddingTrailing = paddingTrailing
        self.paddingTop = paddingTop
        self.paddingBottom = paddingBottom
    }
//    func makeBody(configuration: Self.Configuration) -> some View {
//        devMode()
//        //MyButtonStyleView(configuration: configuration)
//      }
    
    func devMode() -> some View {
        VStack(spacing: 20) {
            makeTextButton()
          // makeRoundCornerButton()
//            makeBorderedRoundCornerButton()
//            makeCircularButton()
//            makeIconImage()
        }
    }
    
    func makeTextButton() -> some View {
        let buttton = Button {
            action?()
        } label: {
            ThemedText(text: text ?? "No Text", textStyle: self.textStyle, textColor: self.textColorTheme ?? .one)
        }
        .buttonStyle(ThemeButtonStyle(button: self))
        return buttton
    }
    
    func makeRoundCornerButton() -> some View {
        Button {
            action?()
        } label: {
            HStack {
                if let image = self.imageName, let tint = imageTintColor {
                    Image(image).renderingMode(.template).foregroundColor(tint)
                    
                }   else if let image = self.imageName {
                    Image(image)
                }
                if let systemImage = systemImage, let tint = imageTintColor {
                        Image(systemName: systemImage).renderingMode(.template).foregroundColor(tint)
                       
                } else if let systemImage = systemImage {
                    Image(systemName: systemImage)
                }
                ThemedText(text: text ?? "No Text", textStyle: self.textStyle, textColor: self.textColorTheme ?? .one)
            }
        }.buttonStyle(ThemeButtonStyle(button: self))
    }
    
    func makeBorderedRoundCornerButton() -> some View {
        Button {
            action?()
        } label: {
            HStack {
                if let image = self.imageName, let tint = imageTintColor {
                    Image(image).renderingMode(.template).foregroundColor(tint)
                    
                }   else if let image = self.imageName {
                    Image(image)
                }
                if let systemImage = systemImage, let tint = imageTintColor {
                    Image(systemName: systemImage).renderingMode(.template).foregroundColor(tint)
                    
                } else if let systemImage = systemImage {
                    Image(systemName: systemImage)
                }
                ThemedText(text: text ?? "No Text", textStyle: self.textStyle, textColor: self.textColorTheme ?? .one)
            }
        }.buttonStyle(ThemeButtonStyle(button: self))
        
    }
    
    func makeCircularButton() -> some View {
        Button {
            action?()
        } label: {
            HStack {
                if let systemImage = systemImage {
                    Image(systemName: systemImage).tint(Color.green)
                }
                ThemedText(text: text ?? "No Text", textStyle: self.textStyle, textColor: self.textColorTheme ?? .one)
           }
        }.buttonStyle(ThemeButtonStyle(button: self))
    }
    
    func makeCircularBorderButton() -> some View {
        Button {
            action?()
        } label: {
            HStack {
                if let systemImage = systemImage {
                    Image(systemName: systemImage).tint(Color.green)
                }
                ThemedText(text: text ?? "No Text", textStyle: self.textStyle, textColor: self.textColorTheme ?? .one)
           }
        }.buttonStyle(ThemeButtonStyle(button: self))
    }
    
    func makeIconImage() -> some View {
        Button {
            action?()
        } label: {
            VStack {
                if let systemImage = systemImage {
                    Image(systemName: systemImage).tint(Color.green)
                } else {
                    Image(systemName: "plus.circle")
                        .font(.system(size: 45, weight: .light))
                        .foregroundColor(backgroundColorTheme?.color ?? ThemeColor.three.color)
                }
                ThemedText(text: text ?? "No Text", textStyle: self.textStyle, textColor: self.textColorTheme ?? .one)
           }
        }.buttonStyle(ThemeButtonStyle(button: self))
    }
}

struct ThemedButton_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ThemedButton(style: .two, text: "Quit", maxWidth: .infinity, maxHeight: 20.0)
//            ThemedButton(style: .two, text: "?", textColorTheme: .seven, backgroundColorTheme: .four,
//                         width: 120,
//                         height: 20
//            )

        }
    }
}
