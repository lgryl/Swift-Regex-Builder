// Created 14/11/2020

import XCTest
@testable import RegexBuilder

class GroupTests: XCTestCase {
    func test_emptyGroup_givesEmptyString() {
        let group = Group {}
        XCTAssertEqual("", group.value)
    }

    func test_group_givesAppendedValues() {
        let group = Group {
            Literal("ab")
            AnyCharacter()
            Literal("cd")
        }
        XCTAssertEqual("ab.cd", group.value)
    }

    func test_groupWithSingleEmptyExpression_givesEmptyString() {
        let group = Group {
            Group {}
        }
        XCTAssertEqual("", group.value)
    }

    func test_groupWithSingleNonEmptyExpression_givesThatExpression() {
        let group = Group {
            Literal("abc")
        }
        XCTAssertEqual("abc", group.value)
    }

    func test_emptyGroupRepeated_givesEmptyString() {
        let group = Group {}.repeated(5)
        XCTAssertEqual("", group.value)
    }

    func test_groupWithEmptyExpressionRepeated_givesEmptyString() {
        let group = Group {
            Group {}
        }.repeated(3)
        XCTAssertEqual("", group.value)
    }

    func test_repeatedGroupWithOnlySingleCharacterLiteral_isNotParenthesized() {
        let group = Group {
            Literal("a")
        }.repeated(2)
        XCTAssertEqual("a{2}", group.value)
    }

    func test_repeatedGroupWithOnlyMultipleCharacterLiteral_isParenthesized() {
        let group = Group {
            Literal("abc")
        }.repeated(3)
        XCTAssertEqual("(abc){3}", group.value)
    }

    func test_wrappedGroups_areNotParenthesized() {
        let group = Group {
            Group {
                AnyDigit()
                AnyCharacter()
            }
            Group {
                Literal("abc")
                AnyCharacter()
            }
        }
        XCTAssertEqual(#"\d.abc."#, group.value)
    }
}
