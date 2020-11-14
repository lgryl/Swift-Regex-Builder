// Created 15/11/2020

import Foundation

internal struct AppendedExpression: Expression {
    private let expression: Expression
    private let content: () -> [Expression]
    let type: ExpressionType = .multiple

    var value: String {
        let appended = content().map { $0.value }.joined()
        return expression.value + "(?=\(appended))"
    }

    internal init(expression: Expression, content: @escaping () -> [Expression]) {
        self.expression = expression
        self.content = content
    }
}
