// Created 19/01/2021

import Foundation

public protocol Prependable {
    func shouldParenthiseWhenPrepended() -> Bool
}

public protocol Appendable {
    func shouldParenthiseWhenAppended() -> Bool
}

public typealias Attachable = Prependable & Appendable

public extension Prependable where Self: Expression {
    func shouldParenthiseWhenPrepended() -> Bool {
        false
    }
}

public extension Appendable where Self: Expression {
    func shouldParenthiseWhenAppended() -> Bool {
        false
    }
}
