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

public extension Expression where Self: Prependable {
    func precededBy(@ExpressionsBuilder _ content: @escaping () -> [Expression]) -> Expression & Attachable {
        PrependedExpression(expression: self, content: content)
    }
}

public extension Expression where Self: Appendable {
    func followedBy(@ExpressionsBuilder _ content: @escaping () -> [Expression]) -> Expression & Attachable {
        AppendedExpression(expression: self, content: content)
    }
}
