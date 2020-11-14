// Created 14/11/2020

import Foundation

public struct Group: Expression, Quantifiable {
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
