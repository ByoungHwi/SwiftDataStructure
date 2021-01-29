//
//  Queue.swift
//  SwiftDataStructure
//
//  Created by Byoung-Hwi Yoon on 2021/01/30.
//

import Foundation

typealias Queue<T> = [T]

extension Queue {
    var poll: Queue.Element? {
        first
    }

    mutating func enqueue(_ element: Queue.Element) {
        append(element)
    }
    
    @discardableResult
    mutating func dequeue() -> Queue.Element? {
        guard !isEmpty else { return nil }
        return removeFirst()
    }
}
