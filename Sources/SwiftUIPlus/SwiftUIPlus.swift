// The Swift Programming Language
// https://docs.swift.org/swift-book
import SwiftUI

@MainActor
public enum SwiftUIPlus {
    /// Creates a SwiftUI TextEditor with a visible placeholder when empty.
    ///
    /// - Parameters:
    ///   - text: The binding to the text being edited.
    ///   - placeholder: The placeholder text shown when the editor is empty.
    ///
    /// You can apply SDK-wide styles via `.environment(\.swiftUIPlusTheme, ...)`
    /// and override per instance using modifiers like `.placeholderFont(...)`.
    ///
    /// - Returns: A stylable TextEditor with placeholder support.
    public static func placeholderTextEditor(
        text: Binding<String>,
        placeholder: String
    ) -> some View {
        PlaceholderTextEditorView(text: text, placeholder: placeholder)
    }
}
