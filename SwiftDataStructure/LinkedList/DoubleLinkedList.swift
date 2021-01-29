//
//  DoubleLinkedList.swift
//  SwiftDataStructure
//
//  Created by Byoung-Hwi Yoon on 2021/01/29.
//

import Foundation

class DoubleLinkedList<T: Equatable> {
    
    final class Node {
        let element: T
        var left: Node?
        var right: Node?
        
        init(_ element: T) {
            self.element = element
        }
    }
    
    private var head: Node?
    private var tail: Node?
    
    subscript(index: Int) -> T? {
        
        if count/2 > index {
            var node = head
            var count = index
            while node != nil && count != 0 {
                node = node?.right
                count -= 1
            }
            return node?.element
        } else {
            var node = tail
            var count = _count - index - 1
            while node != nil && count != 0 {
                node = node?.left
                count -= 1
            }
            return node?.element
        }
    }
    
    var isEmpty: Bool {
        head == nil
    }
    
    private var _count: Int = 0
    var count: Int {
        _count
    }
    
    var first: T? {
        head?.element
    }
    
    var last: T? {
        tail?.element
    }
    
    func insert(_ element: T) {
        
        _count += 1
        
        let newNode = Node(element)
        
        guard !self.isEmpty else {
            head = newNode
            tail = newNode
            return
        }
        
        tail?.right = newNode
        newNode.left = tail
        tail = newNode
    }
    
    func remove(_ element: T) {
        
        guard !self.isEmpty else { return }
        
        var deleteNode = head
        
        while deleteNode != nil {
            guard deleteNode?.element == element else {
                deleteNode = deleteNode?.right
                continue
            }
            
            if deleteNode?.left == nil {
                head = deleteNode?.right
            }
            
            if deleteNode?.right == nil {
                tail = deleteNode?.left
            }
            
            deleteNode?.left?.right = deleteNode?.right
            deleteNode?.right?.left = deleteNode?.left
            
            _count -= 1
            
            break
        }
    }
    
    func removeFirst() {
        _count -= 1
        head?.right?.left = nil
        head = head?.right
        
        if tail?.left == nil {
            _count = 0
            tail = nil
        }
    }
    
    func removeLast() {
        _count -= 1
        tail?.left?.right = nil
        tail = tail?.left
        
        if head?.right == nil {
            _count = 0
            head = nil
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
            
            currentNode = currentNode?.right
        }
    }
    
    func reverseTraversal(forEach operation: ((T) -> Void), until shouldBreak: ((T) -> Bool)? = nil) {
        var currentNode = tail
        
        while currentNode != nil {
            operation(currentNode!.element)
            
            if shouldBreak?(currentNode!.element) ?? false {
                break
            }
            
            currentNode = currentNode?.left
        }
    }
}
