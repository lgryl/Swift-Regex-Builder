// Created 15/11/2020

import Foundation

internal struct PrependedExpression: Expression {
    private let expression: Expression & Prependable
    private let content: () -> [Expression]
    let type: ExpressionType = .multiple

    var value: String {
        let prepended = content().map { $0.value }.joined()
        let expressionParenthisedIfNeeded: Expression = expression.shouldParenthiseWhenPrepended() ? ParenthesizedExpression(expression) : expression
        return "(?<=\(prepended))" + expressionParenthisedIfNeeded.value
    }

    internal init(expression: Expression & Prependable, content: @escaping () -> [Expression]) {
        self.expression = expression
        self.content = content
    }
}

extension PrependedExpression: Attachable {
    func shouldParenthiseWhenPrepended() -> Bool {
        false
    }

    func shouldParenthiseWhenAppended() -> Bool {
        false
    }
}
