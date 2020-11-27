// Created 06/11/2020

import Foundation

@_functionBuilder
public struct RegexBuilder {
    public static func buildBlock() -> String { "" }
    public static func buildBlock(_ expressions: Expression...) -> String {
        expressions.reduce("") { $0 + $1.value }
    }
}

public struct Regex {
    private let content: () -> String

    public init(@RegexBuilder _ content: @escaping () -> String) {
        self.content = content
    }

    public var value: String {
        content()
    }
}
