// Created 07/11/2020

import XCTest
@testable import RegexBuilder

class SingleSymbolExpressionsTests: XCTestCase {
    func test_anyCharacter_givesPeriod() {
        let expression = AnyCharacter()
        XCTAssertEqual(".", expression.value)
    }

    func test_anyCharacterRepeated_isNotParenthesized() {
        let expression = AnyCharacter()
                .repeated(3)
        XCTAssertEqual(".{3}", expression.value)
    }

    func test_anyDigit_givesNumberSymbol() {
        let expression = AnyDigit()
        XCTAssertEqual(#"\d"#, expression.value)
    }

    func test_anyDigitRepeated_isNotParenthesized() {
        let expression = AnyDigit()
                .repeated(5)
        XCTAssertEqual(#"\d{5}"#, expression.value)
    }

    func test_anyNonDigit_givesNonDigitSymbol() {
        let expression = AnyNonDigit()
        XCTAssertEqual(#"\D"#, expression.value)
    }

    func test_anyNonDigitRepeated_isNotParenthesized() {
        let expression = AnyNonDigit()
                .repeated(2)
        XCTAssertEqual(#"\D{2}"#, expression.value)
    }

    func test_anyWordCharacter_givesWordSymbol() {
        let expression = AnyWordCharacter()
        XCTAssertEqual(#"\w"#, expression.value)
    }

    func test_anyWordCharacterRepeated_isNotParenthesized() {
        let expression = AnyWordCharacter()
                .repeated(10)
        XCTAssertEqual(#"\w{10}"#, expression.value)
    }

    func test_anyNonWordCharacter_giveNonWordSymbol() {
        let expression = AnyNonWordCharacter()
        XCTAssertEqual(#"\W"#, expression.value)
    }

    func test_newLine_resultsInNewLineSymbol() {
        let expression = NewLine()
        XCTAssertEqual(#"\n"#, expression.value)
    }

    func test_lineStart_resultsInLineStartAnchor() {
        let expression = LineStart()
        XCTAssertEqual("^", expression.value)
    }

    func test_lineEnd_resultsInLineEndAnchor() {
        let expression = LineEnd()
        XCTAssertEqual("$", expression.value)
    }
}
