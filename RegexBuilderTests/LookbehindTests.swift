// Created 15/11/2020

import XCTest
@testable import RegexBuilder

class LookbehindTests: XCTestCase {
    func test_expressionPrecededByExpression_isPrependedPositiveLookbehind() {
        let expression = Literal("abc")
            .precededBy {
                Literal("d")
                AnyCharacter()
            }

        XCTAssertEqual("(?<=d.)abc", expression.value)
    }

    func test_emptyExpressionPrecededByExpression_givesPositiveLookbehind() {
        let expression = Group {}
            .precededBy {
                Literal("d")
            }
        
        XCTAssertEqual("(?<=d)", expression.value)
    }

    func test_expressionPrecededByEmptyExpression_isPrependedPositiveLookbehind() {
        let expression = Literal("abc")
            .precededBy {}

        XCTAssertEqual("(?<=)abc", expression.value)
    }

    func test_emptyExpressionPrecededByEmptyExpression_givesNullPositiveLookbehind() {
        let expression = Group {}
            .precededBy {}

        XCTAssertEqual("(?<=)", expression.value)
    }
}
