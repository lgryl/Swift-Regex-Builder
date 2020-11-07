// Created 07/11/2020

import Foundation

protocol SingleSymbolExpression: Expression {}

extension SingleSymbolExpression {
    var parenthesizer: Parenthesizer {
        DummyParenthesizer()
    }
}

struct AnyCharacter: SingleSymbolExpression {
    let value = "."
}

struct AnyDigit: SingleSymbolExpression {
    let value = #"\d"#
}

struct AnyNonDigit: SingleSymbolExpression {
    let value = #"\D"#
}

struct AnyWordCharacter: SingleSymbolExpression {
    let value = #"\w"#
}

struct AnyNonWordCharacter: SingleSymbolExpression {
    let value = #"\W"#
}

struct NewLine: SingleSymbolExpression {
    let value = #"\n"#
}

struct LineStart: SingleSymbolExpression {
    let value = "^"
}

struct LineEnd: SingleSymbolExpression {
    let value = "$"
}
