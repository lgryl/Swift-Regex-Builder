// Created 14/11/2020

import Foundation

internal struct ParenthesizedExpression: Expression {
    private let expression: Expression
    internal var value: String { "(\(expression.value))" }
    internal let type: ExpressionType = .single

    internal init(_ expression: Expression) {
        self.expression = expression
    }
}
