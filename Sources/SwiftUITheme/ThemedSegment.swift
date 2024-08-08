//
//  ThemedSegment.swift
//  CommercialKitchen
//
//  Created by ali on 2021-09-22.
//

import SwiftUI

public struct ThemedSegment: View {
    
    @Binding public var selectedTag: Int
    public var values: [(name: String, tag: Int)] = [("Green", 0), ("Red", 1), ("Blue", 2)]
    
    public var selectedThemeColor: ThemeColor?
    public var unselectedThemeColor: ThemeColor?
    
    public var selectedTextColor: ThemeTextColor?
    public var unselectedTextColor: ThemeTextColor?
    
    public init(selectedTag: Binding<Int>, values: [(name: String, tag: Int)] = [("Green", 0), ("Red", 1), ("Blue", 2)], selectedThemeColor: ThemeColor? = nil, unselectedThemeColor: ThemeColor? = nil, selectedTextColor: ThemeTextColor? = nil, unselectedTextColor: ThemeTextColor? = nil) {
        self.values = values
        self.selectedThemeColor = selectedThemeColor
        self.unselectedThemeColor = unselectedThemeColor
        self.selectedTextColor = selectedTextColor
        self.unselectedTextColor = unselectedTextColor
        self._selectedTag = selectedTag
    }
    
    public  var body: some View {
        Picker("What is your favorite color?", selection: $selectedTag) {
            ForEach(values, id: \.name) {
                Text($0.name).tag($0.tag)
            }
        }
        .pickerStyle(.segmented)
        .tint(ThemeColor.three.color)
        .onAppear {
            applyTheme()
        }
    }
     
    func applyTheme() {
        UISegmentedControl.appearance().selectedSegmentTintColor = UIColor(selectedThemeColor?.color ??
                                                                           ThemeColor.three.color)
        
        UISegmentedControl.appearance().backgroundColor = UIColor(unselectedThemeColor?.color ??
                                                                  ThemeColor.two.color)
        
        UISegmentedControl.appearance()
            .setTitleTextAttributes([.foregroundColor: UIColor(selectedTextColor?.color
                                                               ?? ThemeTextColor.eleven.color)],
                                                               for: .selected)
        
        UISegmentedControl.appearance().setTitleTextAttributes([.foregroundColor: UIColor(unselectedTextColor?.color ??
                                                                                          ThemeTextColor.one.color)],
                                                                                          for: .normal)

    }
}

struct ThemedSegment_Previews: PreviewProvider {
    
    static var previews: some View {
        ThemedSegment(selectedTag: .constant(124))
    }
}
