// Created 06/11/2020

import XCTest
@testable import RegexBuilder

class RegexBuilderTests: XCTestCase {
    func test_emptyRegex_returnsEmptyString() {
        let regex = Regex {}
        XCTAssertEqual("", regex.value)
    }

    func test_simpleEmailRegex_returnsCorrectExpression() {
        let regex = Regex {
            AnyWordCharacter()
                .repeated(from: 1, to: 10)
            Literal("@")
            AnyWordCharacter()
                .repeated(from: 1, to: 8)
            Literal(".")
            AnyWordCharacter()
                .repeated(2)
        }
        XCTAssertEqual(#"\w{1,10}@\w{1,8}\.\w{2}"#, regex.value)
    }
}
