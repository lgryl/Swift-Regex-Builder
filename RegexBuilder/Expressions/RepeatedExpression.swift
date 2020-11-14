// Created 07/11/2020

import Foundation

internal struct RepeatedExpression: Expression {
    private let expression: Expression
    let quantifier: Quantifier

    init(expression: Expression, _ quantifier: Quantifier) {
        self.expression = expression
        self.quantifier = quantifier
    }

    var value: String {
        guard expression.type != .empty else { return expression.value }
        return "\(expression.parenthesizedIfNeeded().value)\(quantifier.value)"
    }

    var type: ExpressionType {
        expression.type == .empty ? .empty : .single
    }

    enum Quantifier {
        case zeroOrOne
        case oneOrMore(matchingMode: MatchingMode)
        case zeroOrMore(matchingMode: MatchingMode)
        case exactly(Int)
        case atLeast(Int)
        case inRange(Int, Int)

        var value: String {
            switch self {

            case .zeroOrOne:
                return "?"
            case .oneOrMore(let matchingMode):
                return "+\(matchingMode.symbol)"
            case .zeroOrMore(let matchingMode):
                return "*\(matchingMode.symbol)"
            case .exactly(let number):
                return "{\(number)}"
            case .atLeast(let number):
                return "{\(number),}"
            case .inRange(let lowerBound, let upperBound):
                return "{\(lowerBound),\(upperBound)}"
            }
        }
    }
}
