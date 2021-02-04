// Created 14/11/2020

import Foundation

public struct Alternative: Expression {
    private let expressions: [Expression]
    public var value: String {
        expressions.map { $0.value }.joined(separator: "|")
    }

    public var type: ExpressionType {
        switch expressions.count {
        case 0:
            return .empty
        case 1:
            return expressions[0].type
        default:
            return .multiple
        }
    }

    public init(@ExpressionsBuilder _ content: @escaping () -> [Expression]) {
        expressions = content().filter { $0.type != .empty }
    }
}

extension Alternative: Attachable {
    public func shouldParenthiseWhenPrepended() -> Bool {
        type == .multiple
    }

    public func shouldParenthiseWhenAppended() -> Bool {
        type == .multiple
    }
}

extension Alternative: Quantifiable {
    public func shouldParenthiseWhenRepeated() -> Bool {
        type == .multiple
    }
}
