// Created 14/11/2020

import Foundation

public struct Literal: Expression, Quantifiable {
    public var type: ExpressionType {
        switch value.count {
        case 0:
            return .empty
        case 1:
            return .single
        default:
            return .multiple
        }
    }

    public let value: String

    public init(_ value: String) {
        self.value = NSRegularExpression.escapedPattern(for: value)
    }
}
