//
//  LinkedListTest.swift
//  LinkedListTest
//
//  Created by Byoung-Hwi Yoon on 2021/01/29.
//

import XCTest

class LinkedListTest: XCTestCase {
    
    func test_LinkedList_isEmpty_with_No_Insert() throws {
        let list = LinkedList<Int>()
        XCTAssertTrue(list.isEmpty)
    }
    
    func test_LinkedList_isNotEmpty_with_single_Insert() throws {
        let list = LinkedList<Int>()
        list.insert(1)
        XCTAssertFalse(list.isEmpty)
    }
    
    func test_Count_is_Zero_with_No_Insert() throws {
        let list = LinkedList<Int>()
        XCTAssertEqual(list.count, 0)
    }
    
    func test_Count_is_One_with_Singe_Insert() throws {
        let list = LinkedList<Int>()
        list.insert(1)
        XCTAssertEqual(list.count, 1)
    }
    
    func test_Count_is_10000_with_10000_Inserts() throws {
        let list = LinkedList<Int>()
        
        (1...10000).forEach {
            list.insert($0)
        }
       
        XCTAssertEqual(list.count, 10000)
    }
    
    func test_List_isEmpty_after_remove_all_Elements() throws {
        let list = LinkedList<Int>()
        
        let numbers = [1, 2, 3, 4, 5]
        
        numbers.forEach {
            list.insert($0)
        }
        
        numbers.forEach {
            list.remove($0)
        }
        
        XCTAssertTrue(list.isEmpty)
    }
    
    func test_List_Count_Should_Not_Be_Changed_After_remove_None_Exist_element() throws {
        let list = LinkedList<Int>()
        
        (1...5).forEach {
            list.insert($0)
        }
        
        let countBeforeRemove = list.count
        
        list.remove(99)
        
        let countAfterRemove = list.count
        
        XCTAssertEqual(countBeforeRemove, countAfterRemove)
    }
    
    func test_List_Count_Should_Be_Changed_After_remove_Exist_element() throws {
        let list = LinkedList<Int>()
        
        (1...5).forEach {
            list.insert($0)
        }
        
        let countBeforeRemove = list.count
        
        list.remove(3)
        
        let countAfterRemove = list.count
        
        XCTAssertEqual(countBeforeRemove - 1, countAfterRemove)
    }
    
    func test_Contains_Should_Be_True_with_Exist_element() throws {
        let list = LinkedList<Int>()
        
        (1...5).forEach {
            list.insert($0)
        }
        
        XCTAssertTrue(list.contains(3))
    }
    
    func test_Contains_Should_Be_False_with_None_Exist_element() throws {
        let list = LinkedList<Int>()
        
        (1...5).forEach {
            list.insert($0)
        }
        
        XCTAssertFalse(list.contains(99))
    }
    
    func test_Subscript_Should_Return_Element_of_Index() throws {
        let list = LinkedList<Int>()
        
        (0...5).forEach {
            list.insert($0)
        }
        
        XCTAssertEqual(list[3], 3)
    }
    
    func test_Subscript_Should_Return_Nil_When_Index_Out_Of_Range() throws {
        let list = LinkedList<Int>()
        
        (0...5).forEach {
            list.insert($0)
        }
        
        XCTAssertNil(list[6])
    }

}
