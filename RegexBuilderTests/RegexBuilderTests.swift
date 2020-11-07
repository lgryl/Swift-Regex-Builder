// Created 06/11/2020

import XCTest
@testable import RegexBuilder

class RegexBuilderTests: XCTestCase {
    override func setUpWithError() throws {}

    override func tearDownWithError() throws {}

    func test_emptyRegex_returnsEmptyString() {
        let regex = makeRegex {}
        XCTAssertEqual("", regex)
    }

    func test_regexWithLiteral_returnsThatLiteral() {
        let regex = makeRegex {
            Literal("abc")
        }
        XCTAssertEqual("abc", regex)
    }

    func test_anyCharacterRegex_returnsPeriod() {
        let regex = makeRegex {
            AnyCharacter()
        }
        XCTAssertEqual(".", regex)
    }

    func test_anyCharactersRegex_returnsPeriods() {
        let regex = makeRegex {
            AnyCharacter()
            AnyCharacter()
            AnyCharacter()
        }
        XCTAssertEqual("...", regex)
    }

    func test_literalRepeated_isBracketedAndAppendedQualifier() {
        let regex = makeRegex {
            Literal("abc")
                .repeated(2)
        }
        XCTAssertEqual("(abc){2}", regex)
    }

    func test_singleCharacterLiteralRepeated_isAppendedQualifier() {
        let regex = makeRegex {
            Literal("a")
                .repeated(3)
        }
        XCTAssertEqual("a{3}", regex)
    }

    func test_alternative() {
        let regex = makeRegex {
            Alternative {
                Literal("a")
                Literal("b")
            }
        }
        XCTAssertEqual("a|b", regex)
    }

    func test_alternativeOfAlternatives() {
        let regex = makeRegex {
            Alternative {
                Alternative {
                    Literal("a")
                    Literal("b")
                }
                Alternative {
                    Literal("c")
                    Literal("d")
                }
            }
        }
        XCTAssertEqual("(a|b)|(c|d)", regex)
    }

    func test_periodRepeated_isNotParenthesized() {
        let regex = makeRegex {
            AnyCharacter()
                .repeated(3)
        }
        XCTAssertEqual(".{3}", regex)
    }

    func test() {
        let regex = makeRegex {
            Alternative {
                Literal("a")
                Group {
                    Literal("b")
                    AnyCharacter()
                }
            }
        }
        XCTAssertEqual("a|(b.)", regex)
    }

    func test2() {
        let regex = makeRegex {
            Alternative {
                Literal("a")
                Group {
                    Literal("b")
                    AnyCharacter()
                }
            }
        }
        XCTAssertEqual("a|b", regex)
    }
}
