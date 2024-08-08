//
//  ThemedSlider.swift
//  CommercialKitchen
//
//  Created by ali on 2021-09-21.
//

import SwiftUI

public struct ThemedSlider: View {
    
    @Binding public var currentValue: Double
    public var step: Double = 0.1
    public var start: Double = 30
    public var end: Double = 120
    public var accentColor: ThemeColor?
    
    public init(currentValue: Binding<Double>, step: Double = 0.1,
                  start: Double = 30, end: Double = 120,
                  accentColor: ThemeColor? = nil) {
        self.step = step
        self.start = start
        self.end = end
        self.accentColor = accentColor
        self._currentValue = currentValue
    }
    
    public  var body: some View {
        VStack {
            HStack {
                Slider(value: $currentValue, in: (start...end), step: step)
                    .accentColor(accentColor?.color ?? ThemeColor.three.color)
            }
        }
    }
}

struct ThemedSlider_Previews: PreviewProvider {
    static var previews: some View {
        ThemedSlider(currentValue: .constant(30.0))
    }
}
