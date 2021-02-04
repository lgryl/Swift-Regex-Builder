// Created 14/11/2020

import Foundation

public struct Group: Expression {
    private let expressions: [Expression]
    public var value: String {
        return expressions.map {$0.value}.joined()
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
        self.expressions = content()
    }
}

extension Group: Attachable {
    public func shouldParenthiseWhenPrepended() -> Bool {
        false
    }

    public func shouldParenthiseWhenAppended() -> Bool {
        false
    }
}

extension Group: Quantifiable {
    public func shouldParenthiseWhenRepeated() -> Bool {
        switch type {
        case .empty:
            return false
        case .single:
            return false
        case .multiple:
            return true
        }
    }
}
