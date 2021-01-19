// Created 07/11/2020

import Foundation

protocol SingleSymbolExpression: Expression {}

extension SingleSymbolExpression {
    public var type: ExpressionType {
        return .single
    }
}

public struct AnyCharacter: SingleSymbolExpression, Quantifiable {
    public init() {}
    public let value = "."
}

public struct AnyDigit: SingleSymbolExpression, Quantifiable {
    public init() {}
    public let value = #"\d"#
}

public struct AnyNonDigit: SingleSymbolExpression, Quantifiable {
    public init() {}
    public let value = #"\D"#
}

public struct AnyWordCharacter: SingleSymbolExpression, Quantifiable {
    public init() {}
    public let value = #"\w"#
}

public struct AnyNonWordCharacter: SingleSymbolExpression, Quantifiable {
    public init() {}
    public let value = #"\W"#
}

public struct NewLine: SingleSymbolExpression, Quantifiable {
    public init() {}
    public let value = #"\n"#
}

public struct LineStart: SingleSymbolExpression {
    public init() {}
    public let value = "^"
}

public struct LineEnd: SingleSymbolExpression {
    public init() {}
    public let value = "$"
}
