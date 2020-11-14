// Created 18/11/2020

import Foundation

@_functionBuilder
public struct ExpressionsBuilder {
    static func buildBlock() -> [Expression] { [] }
    static func buildBlock(_ expressions: Expression...) -> [Expression] {
        expressions
    }
}
