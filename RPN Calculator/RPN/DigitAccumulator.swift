//
//  DigitAccumulator.swift
//  RPN
//
//  Created by Sean Acres on 8/22/19.
//  Copyright © 2019 Sean Acres. All rights reserved.
//

import Foundation

public struct DigitAccumulator {
    public enum Digit: Equatable {
        case decimalPoint
        case number(Int)
    }
    
    public enum DigitAccumulatorError: Error {
        case extraDecimalPoint
        case invalidDigitNumberValue
    }
    
    public var digits: [Digit] = []
    public init() {}
    
    public mutating func add(digit: Digit) throws {
        switch digit {
        case .decimalPoint:
            if self.digits.contains(.decimalPoint) {
                throw DigitAccumulatorError.extraDecimalPoint
            }
        case .number(let value):
            if value < 0 || value > 9 {
                throw DigitAccumulatorError.invalidDigitNumberValue
            }
        }
        
        digits.append(digit)
    }
    
    public mutating func clear() {
        digits.removeAll()
    }
    
    public func value() -> Double? {
        // get all of the digits from "digits" and turn them into a single double
        let string = self.digits.map { (digit) -> String in
            switch digit {
            case let .number(x): return String(x)
            case .decimalPoint: return "."
            }
        }.joined()
        
        return Double(string)
    }
}
