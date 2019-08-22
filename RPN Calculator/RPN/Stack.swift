//
//  Stack.swift
//  RPN Calculator
//
//  Created by Sean Acres on 8/21/19.
//  Copyright © 2019 Sean Acres. All rights reserved.
//

import Foundation

struct Stack<T>: ExpressibleByArrayLiteral {
    typealias ArrayLiteralElement = T
    
    private(set) var items: [T]
    
    init(arrayLiteral elements: T...) {
        self.items = elements
    }
    
    init(_ initialItems: [T] = []) {
        self.items = initialItems
    }
    
    // push
    mutating func push(_ value: T) {
        items.append(value)
    }
    
    // pop
    mutating func pop() -> T? {
        return items.popLast()
    }
    
    // peek
    func peek() -> T? {
        return items.last
    }
    
}
