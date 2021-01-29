//
//  Queue2.swift
//  SwiftDataStructure
//
//  Created by Byoung-Hwi Yoon on 2021/01/30.
//

import Foundation

struct Queue2<T> {
    
    private var elements = [T?]()
    private var head: Int = 0
    
    var poll: T? {
        guard !isEmpty else { return nil }
        return elements[head]
    }
    
    var isEmpty: Bool {
        elements.count <= head
    }
    
    var count: Int {
        elements.count - head
    }
    
    private var unusedCapacity: Double {
        Double(head)/Double(elements.count)
    }
    
    private var shouldCleanFront: Bool {
        elements.count >= 100 && unusedCapacity >= 0.25
    }

    mutating func enqueue(_ element: T) {
        elements.append(element)
    }
    
    @discardableResult
    mutating func dequeue() -> T? {
        guard !isEmpty else { return nil }
        let element = elements[head]
        elements[head] = nil
        head += 1
        
        if shouldCleanFront {
            elements.removeFirst(head)
            head = 0
        }
        return element
    }
}
