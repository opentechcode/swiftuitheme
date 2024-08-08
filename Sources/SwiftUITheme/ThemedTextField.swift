//
//  SwiftUIView.swift
//  
//
//  Created by ali on 2021-09-24.
//

import SwiftUI

public enum TextFieldStyle: String {
    /// Simple TextField
    case one
}

public struct ThemedTextField: View {
    public var style: TextFieldStyle = .one
    public var placeHolderText: String?
    @Binding public var text: String
    
    public init(text: Binding<String>, style: TextFieldStyle = .one, placeHolderText: String? = nil) {
        self.style = style
        self._text = text
        self.placeHolderText = placeHolderText
    }
    
    public var body: some View {
        VStack {
            switch style {
            case .one:
                TextField(placeHolderText ?? "", text: $text)
                    .padding()
                    .frame(height: 50)
                    .background(ThemeManager.shared.textField.one.backgroundColor)
                    .cornerRadius(5.0)
                    .foregroundColor(ThemeManager.shared.textField.one.foregroundColor)
            }
        }
    }
}

public struct ThemedSecureField: View {
    public var style: TextFieldStyle = .one
    public var placeHolderText: String?
    @Binding public var text: String
    
    public init(text: Binding<String>, style: TextFieldStyle = .one, placeHolderText: String? = nil) {
        self.style = style
        self._text = text
        self.placeHolderText = placeHolderText
    }
    
    public var body: some View {
        VStack {
            switch style {
            case .one:
                SecureField(placeHolderText ?? "", text: $text)
                    .padding()
                    .frame(height: 50)
                    .background(ThemeManager.shared.textField.one.backgroundColor)
                    .cornerRadius(5.0)
                    .foregroundColor(ThemeManager.shared.textField.one.foregroundColor)
            }
        }
    }
}

struct ThemedTextField_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            ThemedTextField(text: .constant(""), placeHolderText: "Email ID")
            ThemedSecureField(text: .constant(""), placeHolderText: "Password")
        }
    }
}
