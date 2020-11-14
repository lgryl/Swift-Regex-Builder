// Created 15/11/2020

import XCTest
@testable import RegexBuilder

class LookaroundTests: XCTestCase {
    func test_precededAndFollowedExpression_isPrependedAndAppended() {
        let expression = Literal("bcd")
            .precededBy {
                Literal("a")
            }
            .followedBy {
                Literal("e")
            }
        XCTAssertEqual("(?<=a)bcd(?=e)", expression.value)
    }

    func test_followedAndPrecededExpression_isPrependedAndAppended() {
        let expression = Literal("bcd")
            .followedBy {
                Literal("e")
            }
            .precededBy {
                Literal("a")
            }
        XCTAssertEqual("(?<=a)bcd(?=e)", expression.value)
    }
}
