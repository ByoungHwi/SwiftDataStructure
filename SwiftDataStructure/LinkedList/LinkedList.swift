//
//  LinkedList.swift
//  SwiftDataStructure
//
//  Created by Byoung-Hwi Yoon on 2021/01/29.
//

import Foundation

class LinkedList<T: Equatable> {
    
    final class Node {
        let element: T
        var next: Node?
        
        init(_ element: T) {
            self.element = element
        }
    }
    
    private var head: Node?
    
    subscript(index: Int) -> T? {
        var node = head
        var count = index
        while node != nil && count != 0 {
            node = node?.next
            count -= 1
        }
        return node?.element
    }
    
    var isEmpty: Bool {
        head == nil
    }
    
    var count: Int {
        var _count = 0
        traversal { _ in
            _count += 1
        }
        return _count
    }
    
    func insert(_ element: T) {
        
        let newNode = Node(element)
        
        guard !self.isEmpty else {
            head = newNode
            return
        }
        
        var currentLast = head
        
        while currentLast?.next != nil {
            currentLast = currentLast?.next
        }
        
        currentLast?.next = newNode
    }
    
    func remove(_ element: T) {
        
        guard !self.isEmpty else { return }
        
        guard head?.element != element else {
            head = head?.next
            return
        }
        
        var frontNode = head
        var deleteNode = head?.next
        
        while deleteNode != nil {
            if deleteNode?.element == element {
                frontNode?.next = deleteNode?.next
                break
            }
            frontNode = deleteNode
            deleteNode = deleteNode?.next
        }
    }
    
    func contains(_ element: T) -> Bool {
       
        var _contains = false
        
        traversal { _element in
            _contains = element == _element
        } until: { _element in
            element == _element
        }
       
        return _contains
    }
    
    func traversal(forEach operation: ((T) -> Void), until shouldBreak: ((T) -> Bool)? = nil) {
        var currentNode = head
        
        while currentNode != nil {
            operation(currentNode!.element)
            
            if shouldBreak?(currentNode!.element) ?? false {
                break
            }
            
            currentNode = currentNode?.next
        }
    }
}
