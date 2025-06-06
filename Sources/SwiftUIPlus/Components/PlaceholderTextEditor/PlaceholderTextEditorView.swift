//
//  PlaceholderTextEditorView.swift
//  SwiftUIPlus
//
//  Created by Nyein Ei Ei Tun on 2/6/25.
//

import SwiftUI

@MainActor
public struct PlaceholderTextEditorView: View {
    @Binding private var text: String
    private let placeholder: String
    private let font: Font
    private let placeholderColor: Color
    private let alignment: Alignment
    private let textColor: Color
    private let backgroundColor: Color
    private let focusedBorderColor: Color

    public init(
        text: Binding<String>,
        placeholder: String,
        font: Font = .body,
        placeholderColor: Color = .secondary,
        alignment: Alignment = .topLeading,
        textColor: Color = .primary,
        backgroundColor: Color = .clear,
        focusedBorderColor: Color = .clear
    ) {
        self._text = text
        self.placeholder = placeholder
        self.font = font
        self.placeholderColor = placeholderColor
        self.alignment = alignment
        self.textColor = textColor
        self.backgroundColor = backgroundColor
        self.focusedBorderColor = focusedBorderColor
    }

    public var body: some View {
        PlaceholderTextEditor(text: $text, placeholder: placeholder)
            .placeholderFont(font)
            .placeholderColor(placeholderColor)
            .placeholderAlignment(alignment)
            .textColor(textColor)
            .textFieldBackgroundColor(backgroundColor)
            .FocusedBorderColor(focusedBorderColor)
    }
}
