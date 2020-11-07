// Created 11/11/2020

import Foundation

public protocol Expression {
    var value: String { get }
    var parenthesizer: Parenthesizer { get }

    func repeated(_ times: Int) -> Expression
}

extension Expression {
    var parenthesizer: Parenthesizer {
        UnconditionalParenthesizer()
    }
}

extension Expression {
    func repeated(_ count: Int) -> Expression {
        return RepeatedExpression(expression: self, .exactly(count))
    }
}

internal extension Expression {
    func parenthesizedIfNeeded() -> Expression {
        parenthesizer.parenthesized(expression: self)
    }
}
