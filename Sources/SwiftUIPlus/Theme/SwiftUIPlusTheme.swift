//
//  SwiftUIPlusTheme.swift
//  SwiftUIPlus
//
//  Created by Nyein Ei Ei Tun on 1/6/25.
//
import SwiftUI

public struct SwiftUIPlusTheme: Sendable {
    public var placeholderFont: Font
    public var placeholderTextColor: Color
    public var textColor: Color
    public var textFieldBackgroundColor: Color
    public var focusedBorderColor: Color
    public var placeholderAlignment: Alignment
    
    public init(
        placeholderFont: Font,
        placeholderTextColor: Color,
        textColor: Color,
        textFieldBackgroundColor: Color,
        focusedBorderColor: Color,
        placeholderAlignment: Alignment
    ) {
        self.placeholderFont = placeholderFont
        self.placeholderTextColor = placeholderTextColor
        self.textColor = textColor
        self.textFieldBackgroundColor = textFieldBackgroundColor
        self.focusedBorderColor = focusedBorderColor
        self.placeholderAlignment = placeholderAlignment
    }

    public static let `default` = SwiftUIPlusTheme(
        placeholderFont: .body,
        placeholderTextColor: .secondary,
        textColor: .primary,
        textFieldBackgroundColor: .clear,
        focusedBorderColor: .blue,
        placeholderAlignment: .topLeading
    )
}

private struct SwiftUIPlusEnvironmentKey: EnvironmentKey {
    static let defaultValue: SwiftUIPlusTheme = .default
}

public extension EnvironmentValues {
    var swiftUIPlusTheme: SwiftUIPlusTheme {
        get { self[SwiftUIPlusEnvironmentKey.self] }
        set { self[SwiftUIPlusEnvironmentKey.self] = newValue }
    }
}
