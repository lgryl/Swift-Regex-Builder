// Created 15/11/2020

import Foundation

internal struct AppendedExpression: Expression {
    private let expression: Expression & Appendable
    private let content: () -> [Expression]
    let type: ExpressionType = .multiple

    var value: String {
        let appended = content().map { $0.value }.joined()
        let expressionParenthisedIfNeeded: Expression = expression.shouldParenthiseWhenAppended() ? ParenthesizedExpression(expression) : expression
        return expressionParenthisedIfNeeded.value + "(?=\(appended))"
    }

    internal init(expression: Expression & Appendable, content: @escaping () -> [Expression]) {
        self.expression = expression
        self.content = content
    }
}

extension AppendedExpression: Attachable {
    func shouldParenthiseWhenPrepended() -> Bool {
        false
    }
    func shouldParenthiseWhenAppended() -> Bool {
        false
    }
}
