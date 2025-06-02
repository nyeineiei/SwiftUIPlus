//
//  PlaceholderTextEditor.swift
//  SwiftUIPlus
//
//  Created by Nyein Ei Ei Tun on 2/6/25.
//
import SwiftUI

internal struct PlaceholderTextEditor: View {
    private var customFont: Font?
    private var customPlaceholderColor: Color?
    private var customAlignment: Alignment?
    private var customFontSize: CGFloat?
    private var customTextColor: Color?
    private var customTextFieldBackgroundColor: Color?
    
    @Binding private var text: String
    private let placeholder: String
    
    // Environment theme
    @Environment(\.swiftUIPlusTheme) private var theme
    
    var body: some View {
        ZStack(alignment: resolvedAlignment) {
            TextEditor(text: $text)
                .foregroundColor(resolvedTextColor)
                .background(resolvedBackgroundColor)

            if text.isEmpty {
                Text(placeholder)
                    .font(resolvedFont)
                    .foregroundColor(resolvedPlaceholderColor)
                    .padding(.top, 8)
                    .padding(.leading, 5)
                    .allowsHitTesting(false)
            }
        }
    }
    
    // Init
    init(text: Binding<String>, placeholder: String) {
        self._text = text
        self.placeholder = placeholder
    }

    // MARK: - Modifiers

    func placeholderFont(_ font: Font) -> Self {
        var copy = self
        copy.customFont = font
        return copy
    }

    func placeholderColor(_ color: Color) -> Self {
        var copy = self
        copy.customPlaceholderColor = color
        return copy
    }

    func placeholderAlignment(_ alignment: Alignment) -> Self {
        var copy = self
        copy.customAlignment = alignment
        return copy
    }
    
    func textColor(_ color: Color) -> Self {
        var copy = self
        copy.customTextColor = color
        return copy
    }
    
    func textFieldBackgroundColor(_ color: Color) -> Self {
        var copy = self
        copy.customTextFieldBackgroundColor = color
        return copy
    }
}

extension PlaceholderTextEditor {
    private var resolvedFont: Font {
        customFont ?? theme.placeholderFont
    }

    private var resolvedPlaceholderColor: Color {
        customPlaceholderColor ?? theme.placeholderTextColor
    }

    private var resolvedAlignment: Alignment {
        customAlignment ?? theme.placeholderAlignment
    }

    private var resolvedTextColor: Color {
        customTextColor ?? theme.textColor
    }

    private var resolvedBackgroundColor: Color {
        customTextFieldBackgroundColor ?? theme.textFieldBackgroundColor
    }
}
