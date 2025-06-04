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
    private var customFocusedBorderColor: Color?
    
    @Binding private var text: String
    private let placeholder: String
    @Environment(\.swiftUIPlusTheme) private var theme

    init(text: Binding<String>, placeholder: String) {
        self._text = text
        self.placeholder = placeholder
    }

    var body: some View {
        if #available(iOS 15.0, *) {
            PlaceholderTextEditor_iOS15(text: $text, placeholder: placeholder, focusedBorderColor: customFocusedBorderColor ?? theme.focusedBorderColor)
        } else {
            PlaceholderTextEditor_iOS14(text: $text, placeholder: placeholder)
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
    
    func FocusedBorderColor(_ color: Color) -> Self {
        var copy = self
        if color != .clear {
            copy.customFocusedBorderColor = color
        }
        return copy
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

@available(iOS 15.0, *)
private struct PlaceholderTextEditor_iOS15: View {
    @Binding var text: String
    let placeholder: String
    let focusedBorderColor: Color
    @Environment(\.swiftUIPlusTheme) private var theme
    @FocusState private var isFocused: Bool

    var body: some View {
        ZStack(alignment: theme.placeholderAlignment) {
            TextEditor(text: $text)
                .focused($isFocused)
                .foregroundColor(theme.textColor)
                .background(theme.textFieldBackgroundColor)
                .overlay(
                    RoundedRectangle(cornerRadius: 8)
                        .stroke(isFocused ? focusedBorderColor : .clear, lineWidth: 1)
                )

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

