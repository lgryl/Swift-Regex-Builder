// Created 14/11/2020

import XCTest
@testable import RegexBuilder

class AlternativeTests: XCTestCase {
    func test_emptyAlternative_givesEmptyString() {
        let alternative = Alternative {}
        XCTAssertEqual("", alternative.value)
    }

    func test_alternativeWithEmptyAlternative_givesEmptyString() {
        let alternative = Alternative {
                Alternative {}
            }
        XCTAssertEqual("", alternative.value)
    }

    func test_alternativeWithEmptyAlternatives_givesEmptyString() {
        let alternative = Alternative {
                Alternative{}
                Alternative{}
            }
        XCTAssertEqual("", alternative.value)
    }

    func test_alternativeWithOnlySingleNonEmptyExpression_givesThatExpression() {
        let alternative = Alternative {
                Alternative{}
                Literal("abc")
            }
        XCTAssertEqual("abc", alternative.value)
    }

    func test_alternativeMembers_areSeparatedByVerticalBar() {
        let alternative = Alternative {
                Literal("a")
                Literal("b")
            }
        XCTAssertEqual("a|b", alternative.value)
    }

    func test_alternativeMembers_dontGetParenthesized() {
        let alternative = Alternative {
                Literal("a")
                Group {
                    Literal("b")
                    AnyCharacter()
                }
            }
        XCTAssertEqual("a|b.", alternative.value)
    }

    func test_alternativeOfAlternatives_isFlattened() {
        let alternative = Alternative {
                Alternative {
                    Literal("a")
                    Literal("b")
                }
                Alternative {
                    Literal("c")
                    Literal("d")
                }
            }
        XCTAssertEqual("a|b|c|d", alternative.value)
    }

    func test_repeatedSingleAlternativeWithSingleCharacterLiteral_doesntGetParenthesized() {
        let alternative = Alternative {
                Literal("a")
            }.repeated(2)
        XCTAssertEqual("a{2}", alternative.value)
    }

    func test_repeatedSingleAlternativeWithMultiCharacterLiteral_getsParenthesized() {
        let alternative = Alternative {
                Literal("aa")
            }.repeated(2)
        XCTAssertEqual("(aa){2}", alternative.value)
    }

    func test_multipleAlternative_getsParenthesized() {
        let alternative = Alternative {
                Literal("aa")
                Literal("bb")
            }.repeated(2)
        XCTAssertEqual("(aa|bb){2}", alternative.value)
    }

    func test_emptyAlternative_hasTypeEmpty() {
        let alternative = Alternative{}
        XCTAssertEqual(ExpressionType.empty, alternative.type)
    }

    func test_alternativeWithOnlySingleTypeExpression_hasSingleType() {
        let alternative = Alternative {
            Literal("a")
        }
        XCTAssertEqual(ExpressionType.single, alternative.type)
    }

    func test_alternativeWithOnlyMultipleTypeExpression_hasMultipleType() {
        let alternative = Alternative {
            Literal("abc")
        }
        XCTAssertEqual(ExpressionType.multiple, alternative.type)
    }

    func test_alternativeWithMultipleExpressions_hasMultipleType() {
        let alternative = Alternative {
            Literal("abc")
            AnyDigit()
        }
        XCTAssertEqual(ExpressionType.multiple, alternative.type)
    }
}
