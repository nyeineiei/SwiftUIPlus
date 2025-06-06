//
//  PlaceholderTextEditorView_Previews.swift
//  SwiftUIPlus
//
//  Created by Nyein Ei Ei Tun on 2/6/25.
//

import SwiftUI

#if DEBUG
#if os(iOS)
struct PlaceholderTextEditorView_Previews: PreviewProvider {
    @State static var notes = ""

    static var previews: some View {
        PlaceholderTextEditorView(
            text: $notes,
            placeholder: "Add a comment...",
            font: .callout,
            placeholderColor: .secondary,
            textColor: .primary,
            backgroundColor: .gray.opacity(0.05)
        )
        .padding()
        .environment(\.swiftUIPlusTheme, .default)
        .previewDisplayName("Preview - Caption Style")
    }
}
#endif
#endif
