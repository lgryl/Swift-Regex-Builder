// Created 07/11/2020

import Foundation

internal struct RepeatedExpression: Expression {
    private let expression: Expression
    private let `repeat`: Repeat

    init(expression: Expression, _ repeat: Repeat) {
        self.expression = expression
        self.repeat = `repeat`
    }

    var value: String {
        return "\(expression.parenthesizedIfNeeded().value)\(`repeat`.value)"
    }

    enum Repeat {
        case zeroOrOne
        case oneOrMore
        case zeroOrMore
        case exactly(Int)
        case atLeast(Int)
        case inRange(Int, Int)

        var value: String {
            switch self {

            case .zeroOrOne:
                return "?"
            case .oneOrMore:
                return "+"
            case .zeroOrMore:
                return "*"
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
