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
    @Environment(\.swiftUIPlusTheme) private var theme
    
    internal init(text: Binding<String>, placeholder: String) {
        self._text = text
        self.placeholder = placeholder
    }

    var body: some View {
        Group {
            if #available(iOS 15, *) {
                PlaceholderTextEditor_iOS15(text: $text, placeholder: placeholder, theme: theme)
            } else {
                fallbackBody
            }
        }
    }

    private var fallbackBody: some View {
        ZStack(alignment: theme.placeholderAlignment) {
            TextEditor(text: $text)
                .foregroundColor(theme.textColor)
                .background(theme.textFieldBackgroundColor)

            if text.isEmpty {
                Text(placeholder)
                    .font(theme.placeholderFont)
                    .foregroundColor(theme.placeholderTextColor)
                    .padding(.top, 8)
                    .padding(.leading, 5)
                    .allowsHitTesting(false)
            }
        }
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

private struct PlaceholderTextEditor_iOS14: View {
    @Binding var text: String
    let placeholder: String
    @Environment(\.swiftUIPlusTheme) private var theme
    @State private var isFocused: Bool = false

    var body: some View {
        ZStack(alignment: theme.placeholderAlignment) {
            TextEditor(text: $text)
                .foregroundColor(theme.textColor)
                .background(theme.textFieldBackgroundColor)
                .overlay(
                    RoundedRectangle(cornerRadius: 8)
                        .stroke(isFocused ? theme.focusedBorderColor : .clear, lineWidth: 1)
                )
                .onTapGesture {
                    isFocused = true
                }

            if text.isEmpty {
                Text(placeholder)
                    .font(theme.placeholderFont)
                    .foregroundColor(theme.placeholderTextColor)
                    .padding(.top, 8)
                    .padding(.leading, 5)
                    .allowsHitTesting(false)
            }
        }
    }
}

@available(iOS 15, *)
private struct PlaceholderTextEditor_iOS15: View {
    @FocusState private var isFocused: Bool
    @Binding var text: String
    let placeholder: String
    let theme: SwiftUIPlusTheme

    var body: some View {
        ZStack(alignment: theme.placeholderAlignment) {
            TextEditor(text: $text)
                .focused($isFocused)
                .foregroundColor(theme.textColor)
                .background(theme.textFieldBackgroundColor)

            if text.isEmpty {
                Text(placeholder)
                    .font(theme.placeholderFont)
                    .foregroundColor(theme.placeholderTextColor)
                    .padding(.top, 8)
                    .padding(.leading, 5)
                    .allowsHitTesting(false)
            }
        }
    }
}
