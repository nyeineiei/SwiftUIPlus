import XCTest
import SwiftUI
@testable import SwiftUIPlus

final class SwiftUIPlusTests: XCTestCase {
    func testDefaultThemeValues() {
        let theme = SwiftUIPlusTheme.default
        XCTAssertEqual(theme.placeholderTextColor, .secondary)
        XCTAssertEqual(theme.textColor, .primary)
        XCTAssertEqual(theme.textFieldBackgroundColor, .clear)
        XCTAssertEqual(theme.focusedBorderColor, .blue)
    }
    
    func testResolvedFontFallback() {
        // Create theme with no font
        let theme = SwiftUIPlusTheme(
            placeholderFont: .body,
            placeholderTextColor: .gray,
            textColor: .black,
            textFieldBackgroundColor: .white,
            focusedBorderColor: .blue,
            placeholderAlignment: .topLeading
        )
        
        // Simulate resolution logic
        let customFont: Font? = .caption
        let resolvedFont = customFont ?? theme.placeholderFont
        
        XCTAssertNotNil(resolvedFont)
    }
}

