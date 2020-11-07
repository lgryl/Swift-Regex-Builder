// Created 07/11/2020

import XCTest
@testable import RegexBuilder

class SingleSymbolExpressionsTests: XCTestCase {
    func test_anyCharacter_resultsInPeriod() {
        let regex = makeRegex {
            AnyCharacter()
        }
        XCTAssertEqual(".", regex)
    }

    func test_anyDigit_resultsInNumberSymbol() {
        let regex = makeRegex {
            AnyDigit()
        }
        XCTAssertEqual(#"\d"#, regex)
    }

    func test_anyNonDigit_resultsInNonDigitSymbol() {
        let regex = makeRegex {
            AnyNonDigit()
        }
        XCTAssertEqual(#"\D"#, regex)
    }

    func test_anyWordCharacter_resultsInWordSymbol() {
        let regex = makeRegex {
            AnyWordCharacter()
        }
        XCTAssertEqual(#"\w"#, regex)
    }

    func test_anyNonWordCharacter_resultsInNonWordSymbol() {
        let regex = makeRegex {
            AnyNonWordCharacter()
        }
        XCTAssertEqual(#"\W"#, regex)
    }

    func test_newLine_resultsInNewLineSymbol() {
        let regex = makeRegex {
            NewLine()
        }
        XCTAssertEqual(#"\n"#, regex)
    }

    func test_lineStart_resultsInLineStartAnchor() {
        let regex = makeRegex {
            LineStart()
        }
        XCTAssertEqual("^", regex)
    }

    func test_lineEnd_resultsInLineEndAnchor() {
        let regex = makeRegex {
            LineEnd()
        }
        XCTAssertEqual("$", regex)
    }
}
