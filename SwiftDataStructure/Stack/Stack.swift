//
//  Stack.swift
//  SwiftDataStructure
//
//  Created by Byoung-Hwi Yoon on 2021/01/29.
//

import Foundation

typealias Stack<T> = [T]

extension Stack {
    var peek: Stack.Element? {
        last
    }
    
    mutating func push(_ element: Stack.Element) {
        append(element)
    }
    
    @discardableResult
    mutating func pop() -> Stack.Element? {
        popLast()
    }
}
