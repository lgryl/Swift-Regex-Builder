// Created 15/11/2020

import XCTest
@testable import RegexBuilder

class LookaheadTests: XCTestCase {
    func test_expressionFollowedByExpression_isAppendedPositiveLookahead() {
        let expression = Literal("abc")
            .followedBy {
                Literal("d")
                AnyCharacter()
            }
        XCTAssertEqual("abc(?=d.)", expression.value)
    }
    
    func test_emptyExpressionFollowedByExpression_givesPositiveLookahead() {
        let expression = Group {}
            .followedBy {
                Literal("d")
            }
        XCTAssertEqual("(?=d)", expression.value)
    }
    
    func test_expressionFollowedByEmptyExpression_isAppendedNullPositiveLookahead() {
        let expression = Literal("abc")
            .followedBy {}
        XCTAssertEqual("abc(?=)", expression.value)
    }
    
    func test_emptyExpressionFollowedByEmptyExpression_givesNullPositiveLookahead() {
        let expression = Group {}
            .followedBy {}
        XCTAssertEqual("(?=)", expression.value)
    }

    func test_alternativeFollowed_shouldBeParenthised() {
        let alternative = Alternative {
            Literal("foo")
            Literal("bar")
        }.followedBy {
            Literal("aaa")
        }
        XCTAssertEqual("(foo|bar)(?=aaa)", alternative.value)
    }
}
