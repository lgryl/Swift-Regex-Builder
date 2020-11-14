// Created 11/11/2020

import Foundation

public protocol Expression {
    var value: String { get }
    var type: ExpressionType { get }
}

public enum ExpressionType {
    case empty
    case single
    case multiple
}

public extension Expression {
    func parenthesizedIfNeeded() -> Expression {
        switch type {
        case .empty, .single:
            return self
        case .multiple:
            return ParenthesizedExpression(self)
        }
    }
}

public extension Expression {
    func precededBy(@ExpressionsBuilder _ content: @escaping () -> [Expression]) -> Expression {
        PrependedExpression(expression: self, content: content)
    }

    func followedBy(@ExpressionsBuilder _ content: @escaping () -> [Expression]) -> Expression {
        AppendedExpression(expression: self, content: content)
    }
}
