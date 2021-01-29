//
//  Queue3.swift
//  SwiftDataStructure
//
//  Created by Byoung-Hwi Yoon on 2021/01/30.
//

import Foundation

struct Queue3<T: Equatable> {
    
    private var list = DoubleLinkedList<T>()
    
    var poll: T? {
        return list.first
    }
    
    var isEmpty: Bool {
        list.isEmpty
    }
    
    var count: Int {
        list.count
    }

    mutating func enqueue(_ element: T) {
        list.insert(element)
    }
    
    @discardableResult
    mutating func dequeue() -> T? {
        let element = list.first
        list.removeFirst()
        return element
    }
}
