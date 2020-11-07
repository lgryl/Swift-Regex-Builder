// Created 06/11/2020

import Foundation

@_functionBuilder
struct RegexBuilder {
    static func buildBlock() -> String { "" }
    static func buildBlock(_ expressions: Expression...) -> String {
        expressions.reduce("") { $0 + $1.value }
    }
}

@_functionBuilder
struct AlternativeBuilder {
    static func buildBlock() -> String { "" }
    static func buildBlock(_ expressions: Expression...) -> String {
        expressions.map { $0.parenthesizedIfNeeded().value }.joined(separator: "|")
    }
}

func makeRegex(@RegexBuilder _ content: () -> String) -> String {
    content()
}

struct Empty: Expression {
    let value = ""
}

struct Literal: Expression {
    let value: String
    var parenthesizer: Parenthesizer = LiteralParenthesizer()

    init(_ value: String) {
        self.value = value
    }
}

internal struct ParenthesizedExpression: Expression {
    let expression: Expression
    var value: String { "(\(expression.value))" }

    init(_ expression: Expression) {
        self.expression = expression
    }
}

struct Alternative: Expression {
    let content: () -> String
    var value: String {
        content()
    }

    init(@AlternativeBuilder _ content: @escaping () -> String) {
        self.content = content
    }
}

struct Group: Expression {
    let content: () -> String
    var value: String {
        content()
    }

    init(@RegexBuilder _ content: @escaping () -> String) {
        self.content = content
    }
}

//struct GroupParenthesizer: Parenthesizer {
//    func parenthesized(expression: Expression) -> Expression {
//        guard let group = expression as? Group else { return Empty() }
//        if group.
//    }
//}
