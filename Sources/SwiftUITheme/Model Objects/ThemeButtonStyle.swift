//
//  TestThemeButton.swift
//  CommercialKitchen
//
//  Created by ali on 2021-09-07.
//

import SwiftUI

extension Color {
    static let defaultBlue = Color(red: 0, green: 97 / 255.0, blue: 205 / 255.0)
    static let paleBlue = Color(red: 188 / 255.0, green: 224 / 255.0, blue: 253 / 255.0)
    static let paleWhite = Color(white: 1, opacity: 179 / 255.0)
}

struct ThemeButtonStyle: ButtonStyle {
    
    ///MARK: Custom Parameters
    var button: ThemedButton
    @Environment(\.isEnabled) var isEnabled
    
    func makeBody(configuration: Self.Configuration) -> some View {
        VStack {
            switch button.style {
            case .one:
                 makeTextButton(configuration: configuration)
            case .two:
                 makeRoundCornerButton(configuration: configuration)
            case .three:
                makeBorderedRoundCornerButton(configuration: configuration)
            case .four:
                makeCircularButton(configuration: configuration)
            case .five:
                makeCircularBorderButton(configuration: configuration)
            case .six:
                makeIconImage(configuration: configuration)
            }
        }
    }
    
    func makeTextButton(configuration: Self.Configuration) -> some View {
        return configuration.label
            .foregroundColor(button.textColorTheme?.color ?? ThemeTextColor.three.color)
            .opacity(configuration.isPressed ? 0.7 : 1.0)
            .scaleEffect(configuration.isPressed ? 0.95 : 1.0)
    }
    
    func makeRoundCornerButton(configuration: Self.Configuration) -> some View {
        VStack {
            if button.maxWidth != nil || button.maxHeight != nil {
                 configuration.label
                    .frame(maxWidth: button.maxWidth ?? .infinity, maxHeight: button.maxHeight ?? .infinity, alignment: .center)
                    .padding(.top,  button.paddingTop ?? 10.0)
                    .padding(.bottom, button.paddingBottom ?? 10.0)
                    .padding(.leading, button.paddingLeading ?? 10.0)
                    .padding(.trailing, button.paddingTrailing ?? 10.0)
                    .background (configuration.isPressed ?
                                 (button.pressedBackgroundColorTheme?.color ?? ThemeColor.three.color) :
                                     (button.backgroundColorTheme?.color ?? ThemeColor.three.color))
                    .foregroundColor(button.textColorTheme?.color ?? ThemeTextColor.eleven.color)
                    .cornerRadius( button.roundCorner ? .infinity : 5)
                    .shadow(color: button.backgroundColorTheme?.color ?? ThemeColor.three.color, radius: 5, y: 2)
                    .opacity(configuration.isPressed ? 0.8 : 1.0)
                    .scaleEffect(configuration.isPressed ? 0.95 : 1.0)
            }
            else {
                 configuration.label
                    .frame(width: button.width ?? .infinity, height: button.width ?? .infinity, alignment: .center)
                    .padding(.top,  button.paddingTop ?? 10.0)
                    .padding(.bottom, button.paddingBottom ?? 10.0)
                    .padding(.leading, button.paddingLeading ?? 10.0)
                    .padding(.trailing, button.paddingTrailing ?? 10.0)
                    .background (configuration.isPressed ?
                                 (button.pressedBackgroundColorTheme?.color ?? ThemeColor.three.color) :
                                     (button.backgroundColorTheme?.color ?? ThemeColor.three.color))
                    .foregroundColor(button.textColorTheme?.color ?? ThemeTextColor.eleven.color)
                    .cornerRadius( button.roundCorner ? .infinity : 5)
                    .shadow(color: button.backgroundColorTheme?.color ?? ThemeColor.three.color, radius: 5, y: 2)
                    .opacity(configuration.isPressed ? 0.8 : 1.0)
                    .scaleEffect(configuration.isPressed ? 0.95 : 1.0)
            }
        }
        
    }
    
    func makeBorderedRoundCornerButton(configuration: Self.Configuration) -> some View {
        VStack {
            if button.maxWidth != nil || button.maxHeight != nil {
                configuration.label
                    .frame(maxWidth: button.maxWidth ?? .infinity, maxHeight: button.maxHeight ?? .infinity, alignment: .center)
                    .padding(.top,  button.paddingTop ?? 10.0)
                    .padding(.bottom, button.paddingBottom ?? 10.0)
                    .padding(.leading, button.paddingLeading ?? 10.0)
                    .padding(.trailing, button.paddingTrailing ?? 10.0)
                    .foregroundColor(button.textColorTheme?.color ?? ThemeColor.three.color)
                    .opacity(configuration.isPressed ? 0.8 : 1.0)
                    .scaleEffect(configuration.isPressed ? 0.95 : 1.0)
                    .background(RoundedRectangle(cornerRadius: button.roundCorner ? .infinity : 5)
                                    .stroke(button.backgroundColorTheme?.color ?? ThemeColor.three.color, lineWidth: 1))
            }
            else {
                configuration.label
                    .frame(width: button.width ?? .infinity, height: button.height ?? .infinity, alignment: .center)
                    .padding(.top,  button.paddingTop ?? 10.0)
                    .padding(.bottom, button.paddingBottom ?? 10.0)
                    .padding(.leading, button.paddingLeading ?? 10.0)
                    .padding(.trailing, button.paddingTrailing ?? 10.0)
                    .foregroundColor(button.textColorTheme?.color ?? ThemeColor.three.color)
                    .opacity(configuration.isPressed ? 0.8 : 1.0)
                    .scaleEffect(configuration.isPressed ? 0.95 : 1.0)
                    .background(RoundedRectangle(cornerRadius: button.roundCorner ? .infinity : 5)
                                    .stroke(button.backgroundColorTheme?.color ?? ThemeColor.three.color, lineWidth: 1))
            }
        }
            
        
    }
    
    func makeCircularButton(configuration: Self.Configuration) -> some View {
        return configuration.label
            .frame(width: button.width ?? .infinity, height: button.height ?? .infinity, alignment: .center)
            .padding(.top,  button.paddingTop ?? 15.0)
            .padding(.bottom, button.paddingBottom ?? 15.0)
            .padding(.leading, button.paddingLeading ?? 15.0)
            .padding(.trailing, button.paddingTrailing ?? 15.0)
            .foregroundColor(button.textColorTheme?.color ?? ThemeTextColor.eleven.color)
            .opacity(configuration.isPressed ? 0.8 : 1.0)
            .scaleEffect(configuration.isPressed ? 0.95 : 1.0)
            .background(button.backgroundColorTheme?.color ?? ThemeColor.three.color)
            .clipShape(Circle())
            
        
    }
    
    func makeCircularBorderButton(configuration: Self.Configuration) -> some View {
        return configuration.label
            .frame(width: button.width ?? .infinity, height: button.height ?? .infinity, alignment: .center)
            .padding(.top,  button.paddingTop ?? 15.0)
            .padding(.bottom, button.paddingBottom ?? 15.0)
            .padding(.leading, button.paddingLeading ?? 15.0)
            .padding(.trailing, button.paddingTrailing ?? 15.0)
            .foregroundColor(button.textColorTheme?.color ?? ThemeTextColor.three.color)
            .opacity(configuration.isPressed ? 0.8 : 1.0)
            .scaleEffect(configuration.isPressed ? 0.95 : 1.0)
            .background(Circle()
                            .stroke(button.backgroundColorTheme?.color ?? ThemeColor.three.color, lineWidth: 1))
    }
    
    func makeIconImage(configuration: Self.Configuration) -> some View {
        return configuration.label
            .frame(width: button.width ?? .infinity, height: button.height ?? .infinity, alignment: .center)
            .padding(.top, button.paddingTop ?? 10.0)
            .padding(.bottom, button.paddingBottom ?? 10.0)
            .padding(.leading, button.paddingLeading ?? 10.0)
            .padding(.trailing, button.paddingTrailing ?? 10.0)
            .foregroundColor(button.textColorTheme?.color ?? ThemeTextColor.three.color)
    }
}



