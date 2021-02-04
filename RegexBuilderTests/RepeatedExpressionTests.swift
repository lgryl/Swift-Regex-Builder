// Created 07/11/2020

import XCTest
@testable import RegexBuilder

class RepeatedExpressionTests: XCTestCase {
    func test_expressionRepeatedZeroOrMoreTimesWithGreedyMode_hasNoLazyQuantifier() {
        let expression = AnyCharacter()
            .repeatedZeroOrMoreTimes(mode: .greedy)
        XCTAssertEqual(".*", expression.value)
    }

    func test_expressionRepeatedOneOrMoreTimesWithGreedyMode_hasNoLazyQuantifier() {
        let expression = AnyCharacter()
            .repeatedOneOrMoreTimes(mode: .greedy)
        XCTAssertEqual(".+", expression.value)
    }

    func test_expressionRepeatedZeroOrMoreTimesWithLazyMode_hasLazyQuantifier() {
        let expression = AnyCharacter()
            .repeatedZeroOrMoreTimes(mode: .lazy)
        XCTAssertEqual(".*?", expression.value)
    }

    func test_expressionRepeatedOneOrMoreTimesWithLazyMode_hasLazyQuantifier() {
        let expression = AnyCharacter()
            .repeatedOneOrMoreTimes(mode: .lazy)
        XCTAssertEqual(".+?", expression.value)
    }

    func test_expressionRepeatedZeroOrMoreTimesWithoutMode_hasNoLazyQuantifier() {
        let expression = AnyCharacter()
            .repeatedZeroOrMoreTimes()
        XCTAssertEqual(".*", expression.value)
    }

    func test_expressionRepeatedOneOrMoreTimesWithoutMode_hasNoLazyQuantifier() {
        let expression = AnyCharacter()
            .repeatedOneOrMoreTimes()
        XCTAssertEqual(".+", expression.value)
    }

    func test_emptyExpressionRepeated_hasEmptyType() {
        let expression = Group {}
            .repeated(2)
        XCTAssertEqual(ExpressionType.empty, expression.type)
    }

    func test_singleTypeExpressionRepeated_hasSingleType() {
        let expression = Literal("a")
            .repeated(3)
        XCTAssertEqual(ExpressionType.single, expression.type)
    }

    func test_multipleTypeExpressionRepeated_hasSingleType() {
        let expression = Literal("aaa")
            .repeated(3)
        XCTAssertEqual(ExpressionType.single, expression.type)
    }

    func test_expressionRepeatedZeroOrOneTimes_isAppendedSymbol() {
        let expression = Literal("a")
            .repeatedZeroOrOneTime()
        XCTAssertEqual("a?", expression.value)
    }

    func test_expressionRepeatedExactNumberOfTimes_isAppednedSymbol() {
        let expression = Literal("a")
            .repeated(5)
        XCTAssertEqual("a{5}", expression.value)

    }

    func test_expressionRepeatedAtLeastNumberOfTimes_isAppednedSymbol() {
        let expression = Literal("a")
            .repeated(atLeast: 3)
        XCTAssertEqual("a{3,}", expression.value)
    }

    func test_singleCharacterLiteralRepeated_isNotParenthised() {
        let expression = Literal("a")
            .repeated(5)
        XCTAssertEqual("a{5}", expression.value)
    }

    func test_multiCharacterLiteralRepeated_isParenthised() {
        let expression = Literal("abc")
            .repeated(5)
        XCTAssertEqual("(abc){5}", expression.value)
    }
}
