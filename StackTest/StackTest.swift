//
//  StackTest.swift
//  StackTest
//
//  Created by Byoung-Hwi Yoon on 2021/01/29.
//

import XCTest

class StackTest: XCTestCase {

    func test_Stack_isEmpty_with_No_Push() {
        let stack = Stack<Int>()
        XCTAssertTrue(stack.isEmpty)
    }
    
    func test_Stack_isNotEmpty_with_Push() {
        var stack = Stack<Int>()
        stack.push(5)
        XCTAssertFalse(stack.isEmpty)
    }
    
    func test_Stack_isEmpty_After_Pop_All_Elements() {
        var stack = Stack<Int>()
        (1...10).forEach {
            stack.push($0)
        }
        
        (1...10).forEach { _ in
            stack.pop()
        }
        
        XCTAssertTrue(stack.isEmpty)
    }
    
    func test_Stack_isNotEmpty_After_Pop_Some_Elements() {
        var stack = Stack<Int>()
        (1...10).forEach {
            stack.push($0)
        }
        
        (1...7).forEach { _ in
            stack.pop()
        }
        
        XCTAssertFalse(stack.isEmpty)
    }
    
    func test_Pop_Should_Return_Nil_When_Stack_isEmpty() {
        var stack = Stack<Int>()
        XCTAssertNil(stack.pop())
    }
    
    func test_Pop_Should_Return_Last_Pushed_Element() {
        var stack = Stack<Int>()
        
        stack.push(10)
        stack.push(1)
        stack.push(7)
        stack.push(6)
        stack.push(9)
        
        XCTAssertEqual(stack.pop(), 9)
    }
    
    func test_Pop_Should_Return_Last_Pushed_Element_After_Some_Pop() {
        var stack = Stack<Int>()
        
        stack.push(10)
        stack.push(1)
        stack.push(7)
        stack.push(6)
        stack.push(9)
        
        stack.pop()
        stack.pop()
        stack.pop()
        
        XCTAssertEqual(stack.pop(), 1)
    }
    
    func test_Peek_Should_Return_Last_Pushed_Element() {
        var stack = Stack<Int>()
        
        stack.push(10)
        stack.push(1)
        stack.push(7)
        stack.push(6)
        stack.push(9)
        
        XCTAssertEqual(stack.peek, 9)
    }
    
    func test_Peek_Should_Return_Last_Pushed_Element_After_Some_Pop() {
        var stack = Stack<Int>()
        
        stack.push(10)
        stack.push(1)
        stack.push(7)
        stack.push(6)
        stack.push(9)
        
        stack.pop()
        stack.pop()
        stack.pop()
        
        XCTAssertEqual(stack.peek, 1)
    }
    
    func test_Peek_Should_Return_Nil_When_Stack_isEmpty() {
        let stack = Stack<Int>()
        XCTAssertNil(stack.peek)
    }
    
    func test_Count_Should_Be_Reduced_After_Pop() {
        var stack = Stack<Int>()
        
        stack.push(10)
        stack.push(1)
        stack.push(7)
        stack.push(6)
        stack.push(9)
        
        let countBeforePop = stack.count
        
        stack.pop()
        
        let countAfertPop = stack.count
        
        XCTAssertEqual(countBeforePop - 1, countAfertPop)
    }
    
    func test_Count_Should_Be_Reduced_After_Some_Pop() {
        var stack = Stack<Int>()
        
        stack.push(10)
        stack.push(1)
        stack.push(7)
        stack.push(6)
        stack.push(9)
        
        let countBeforePop = stack.count
        
        stack.pop()
        stack.pop()
        stack.pop()
        
        let countAfertPop = stack.count
        
        XCTAssertEqual(countBeforePop - 3, countAfertPop)
    }

}
