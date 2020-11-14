// Created 15/11/2020

import Foundation

internal struct PrependedExpression: Expression {
    private let expression: Expression
    private let content: () -> [Expression]
    let type: ExpressionType = .multiple

    var value: String {
        let prepended = content().map { $0.value }.joined()
        return "(?<=\(prepended))" + expression.value
    }

    internal init(expression: Expression, content: @escaping () -> [Expression]) {
        self.expression = expression
        self.content = content
    }
}
