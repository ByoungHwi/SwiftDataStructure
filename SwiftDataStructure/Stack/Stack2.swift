//
//  Stack2.swift
//  SwiftDataStructure
//
//  Created by Byoung-Hwi Yoon on 2021/01/29.
//

import Foundation

struct Stack2<T:Equatable> {
    
    private var list = DoubleLinkedList<T>()
    
    var peek: T? {
        list.last
    }
    
    var count: Int {
        list.count
    }
    
    var isEmpty: Bool {
        list.isEmpty
    }
    
    mutating func push(_ element: T) {
        list.insert(element)
    }
    
    @discardableResult
    mutating func pop() -> T? {
        let element = list.last
        list.removeLast()
        return element
    }
    
}
