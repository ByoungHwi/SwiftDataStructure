//
//  Queue3Test.swift
//  QueueTest
//
//  Created by Byoung-Hwi Yoon on 2021/01/30.
//

import XCTest

class Queue3Test: XCTestCase {

    func test_Queue_isEmpty_with_No_Dequeue() {
        let queue = Queue3<Int>()
        XCTAssertTrue(queue.isEmpty)
    }
    
    func test_Queue_isNotEmpty_with_Enqueue() {
        var queue = Queue3<Int>()
        queue.enqueue(5)
        XCTAssertFalse(queue.isEmpty)
    }
    
    func test_queue_isEmpty_After_Dequeue_All_Elements() {
        var queue = Queue3<Int>()
        (1...10).forEach {
            queue.enqueue($0)
        }
        
        (1...10).forEach { _ in
            queue.dequeue()
        }
        
        XCTAssertTrue(queue.isEmpty)
    }
    
    func test_queue_isNotEmpty_After_Dequeue_Some_Elements() {
        var queue = Queue3<Int>()
        (1...10).forEach {
            queue.enqueue($0)
        }
        
        (1...7).forEach { _ in
            queue.dequeue()
        }
        
        XCTAssertFalse(queue.isEmpty)
    }
    
    func test_Dequeue_Should_Return_Nil_When_Queue_isEmpty() {
        var queue = Queue3<Int>()
        XCTAssertNil(queue.dequeue())
    }
    
    func test_Dequeue_Should_Return_First_Enqueued_Element() {
        var queue = Queue3<Int>()
        
        queue.enqueue(10)
        queue.enqueue(1)
        queue.enqueue(7)
        queue.enqueue(6)
        queue.enqueue(9)
        
        XCTAssertEqual(queue.dequeue(), 10)
    }
    
    func test_Dequeue_Should_Return_First_Enqueueed_Element_After_Some_Dequeue() {
        var queue = Queue3<Int>()
        
        queue.enqueue(10)
        queue.enqueue(1)
        queue.enqueue(7)
        queue.enqueue(6)
        queue.enqueue(9)
        
        queue.dequeue()
        queue.dequeue()
        queue.dequeue()
        
        XCTAssertEqual(queue.dequeue(), 6)
    }
    
    func test_Poll_Should_Return_First_Enqueueed_Element() {
        var queue = Queue3<Int>()
        
        queue.enqueue(10)
        queue.enqueue(1)
        queue.enqueue(7)
        queue.enqueue(6)
        queue.enqueue(9)
        
        XCTAssertEqual(queue.poll, 10)
    }
    
    func test_Poll_Should_Return_First_Enqueueed_Element_After_Some_Dequeue() {
        var queue = Queue3<Int>()
        
        queue.enqueue(10)
        queue.enqueue(1)
        queue.enqueue(7)
        queue.enqueue(6)
        queue.enqueue(9)
        
        queue.dequeue()
        queue.dequeue()
        queue.dequeue()
        
        XCTAssertEqual(queue.poll, 6)
    }
    
    func test_Poll_Should_Return_Nil_When_Queue_isEmpty() {
        let queue = Queue3<Int>()
        XCTAssertNil(queue.poll)
    }
    
    func test_Count_Should_Be_Reduced_After_Dequeue() {
        var queue = Queue3<Int>()
        
        queue.enqueue(10)
        queue.enqueue(1)
        queue.enqueue(7)
        queue.enqueue(6)
        queue.enqueue(9)
        
        let countBeforeDequeue = queue.count
        
        queue.dequeue()
        
        let countAfterDequeue = queue.count
        
        XCTAssertEqual(countBeforeDequeue - 1, countAfterDequeue)
    }
    
    func test_Count_Should_Be_Reduced_After_Some_Dequeue() {
        var queue = Queue3<Int>()
        
        queue.enqueue(10)
        queue.enqueue(1)
        queue.enqueue(7)
        queue.enqueue(6)
        queue.enqueue(9)
        
        let countBeforeDequeue = queue.count
        
        queue.dequeue()
        queue.dequeue()
        queue.dequeue()
        
        let countAfterDequeue = queue.count
        
        XCTAssertEqual(countBeforeDequeue - 3, countAfterDequeue)
    }
}

