//
//  ThemeManager.swift
//  CommercialKitchen
//
//  Created by ali on 2021-08-03.
//

import Foundation
import SwiftUI


public class ThemeManager {
    
    //MARK: - Public variables
    
    public static let shared = ThemeManager()
    
    public var currentTheme: ThemeStyle {
        return theme
    }
    
    public var colorsData: ColorData {
        return themeData.colors
    }
    
    public var textColors: TextColorData {
        return themeData.textColors
    }
    
    public var fonts: FontsData {
        return themeData.fonts
    }
    
    public var textField: TextFields {
        return themeData.textfields
    }
    
    //MARK: - Private variables
    private var tintColor: Color!
    private var theme: ThemeStyle = .light
    private var themeData: ThemeData!
    
    
    //MARK: - initialize
    
    private init() {
        loadThemeStyle()
        loadCurrentTheme()
    }
    
    //MARK: - Public methods
    
    public func setTheme(style: ThemeStyle) {
        theme = style
        saveThemeStyle()
        loadCurrentTheme()
    }
    
    //MARK: - Private methods
    
    private func loadThemeStyle() {
        if let style = UserDefaults.standard.string(forKey: ThemeUtil.Prefs.ThemeStyle), let loadedtheme = ThemeStyle.init(rawValue: style) {
            self.theme = loadedtheme
        }
    }
    
    private func saveThemeStyle() {
        UserDefaults.standard.setValue(theme.rawValue, forKey: ThemeUtil.Prefs.ThemeStyle)
   }
    
    private func loadCurrentTheme() {
        if let themeContent = loadPlist(plist: theme.rawValue) {
            self.themeData = ThemeData(dict: themeContent)
            self.tintColor = uicolorFromHex(hex: themeData.tintColor)
        }
    }
    
    private func loadPlist(plist: String) -> [String: Any]? {
        let bundle = Bundle.module
        guard let path = bundle.url(forResource: plist, withExtension: "plist") else {
            return nil
        }
        do {
            let pListData  = try Data.init(contentsOf: path)
            let pListObject = try PropertyListSerialization.propertyList(from: pListData, options:PropertyListSerialization.ReadOptions(), format:nil)
            guard let pListDict = pListObject as? [String: Any] else {
                return nil
            }
            return pListDict
        } catch {
            print("Error reading regions plist file: \(error)")
            return nil
        }
    }
    
    
}
