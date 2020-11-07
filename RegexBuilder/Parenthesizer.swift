// Created 11/11/2020

import Foundation

public protocol Parenthesizer {
    func parenthesized(expression: Expression) -> Expression
}

struct LiteralParenthesizer: Parenthesizer {
    func parenthesized(expression: Expression) -> Expression {
        if expression.value.count > 1 {
            return ParenthesizedExpression(expression)
        } else {
            return expression
        }
    }
}

struct UnconditionalParenthesizer: Parenthesizer {
    func parenthesized(expression: Expression) -> Expression {
        ParenthesizedExpression(expression)
    }
}

struct DummyParenthesizer: Parenthesizer {
    func parenthesized(expression: Expression) -> Expression {
        return expression
    }
}
