// Created 14/11/2020

import XCTest
@testable import RegexBuilder

class LiteralTests: XCTestCase {
    func test_emptyLiteral_returnsEmptyString() {
        let literal = Literal("")
        XCTAssertEqual("", literal.value)
    }

    func test_emptyLiteralRepeated_returnsEmptyString() {
        let literal = Literal("")
            .repeated(4)
        XCTAssertEqual("", literal.value)
    }

    func test_literalWithString_returnsThatString() {
        let literal = Literal("abc")
        XCTAssertEqual("abc", literal.value)
    }

    func test_singleCharacterLiteralRepeated_isAppendedQualifier() {
        let literal = Literal("a")
            .repeated(3)
        XCTAssertEqual("a{3}", literal.value)
    }

    func test_multiCharacterliteralRepeated_isParethesizedAndAppendedQualifier() {
        let literal = Literal("abc")
            .repeated(2)
        XCTAssertEqual("(abc){2}", literal.value)
    }

    func test_specialCharactersInLiteral_areEscaped() {
        let literal = Literal(#"\^$.|?*+()[{"#)
        XCTAssertEqual(#"\\\^\$\.\|\?\*\+\(\)\[\{"#, literal.value)
    }
}
