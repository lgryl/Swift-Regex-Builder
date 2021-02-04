// Created 15/11/2020

import Foundation

public protocol Quantifiable {
    func shouldParenthiseWhenRepeated() -> Bool
}

public extension Quantifiable where Self: Expression {
    func shouldParenthiseWhenRepeated() -> Bool {
        true
    }
}

public extension Quantifiable where Self: Expression {
    func repeated(_ times: Int) -> some Expression {
        RepeatedExpression(expression: self, .exactly(times))
    }

    func repeated(atLeast times: Int) -> some Expression {
        RepeatedExpression(expression: self, .atLeast(times))
    }

    func repeated(from lowerBound: Int, to upperBound: Int) -> some Expression {
        RepeatedExpression(expression: self, .inRange(lowerBound, upperBound))
    }

    func repeatedZeroOrOneTime() -> some Expression {
        RepeatedExpression(expression: self, .zeroOrOne)
    }

    func repeatedZeroOrMoreTimes(mode: MatchingMode = .greedy) -> some Expression {
        RepeatedExpression(expression: self, .zeroOrMore(matchingMode: mode))
    }

    func repeatedOneOrMoreTimes(mode: MatchingMode = .greedy) -> some Expression {
        RepeatedExpression(expression: self, .oneOrMore(matchingMode: mode))
    }
}

public enum MatchingMode {
    case lazy
    case greedy

    internal var symbol: String {
        switch self {
        case .lazy:
            return "?"
        case .greedy:
            return ""
        }
    }
}
