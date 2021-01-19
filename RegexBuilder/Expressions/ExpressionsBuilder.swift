// Created 18/11/2020

import Foundation

@_functionBuilder
public struct ExpressionsBuilder {
    public static func buildBlock() -> [Expression] { [] }
    public static func buildBlock(_ expressions: Expression...) -> [Expression] {
        expressions
    }
}
