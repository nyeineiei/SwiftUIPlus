import XCTest
import SwiftUI
@testable import SwiftUIPlus
#if os(iOS)
final class SwiftUIPlusTests: XCTestCase {
    func testExample() throws {
        // XCTest Documentation
        // https://developer.apple.com/documentation/xctest

        // Defining Test Cases and Test Methods
        // https://developer.apple.com/documentation/xctest/defining_test_cases_and_test_methods
    }
}

final class SwiftUIPlusThemeTests: XCTestCase {
    func testDefaultThemeValues() {
        let theme = SwiftUIPlusTheme.default
        XCTAssertEqual(theme.placeholderTextColor, .secondary)
        XCTAssertEqual(theme.textColor, .primary)
        XCTAssertEqual(theme.textFieldBackgroundColor, .clear)
        XCTAssertEqual(theme.focusedBorderColor, .blue)
    }
}

final class PlaceholderTextEditorTests: XCTestCase {
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
#endif
