//
//  DoubleLinkedListTest.swift
//  LinkedListTest
//
//  Created by Byoung-Hwi Yoon on 2021/01/29.
//

import XCTest

class DoubleLinkedListTest: XCTestCase {

    func test_DoubleLinkedList_isEmpty_with_No_Insert() throws {
        let list = DoubleLinkedList<Int>()
        XCTAssertTrue(list.isEmpty)
    }
    
    func test_DoubleLinkedList_isNotEmpty_with_single_Insert() throws {
        let list = DoubleLinkedList<Int>()
        list.insert(1)
        XCTAssertFalse(list.isEmpty)
    }
    
    func test_Count_is_Zero_with_No_Insert() throws {
        let list = DoubleLinkedList<Int>()
        XCTAssertEqual(list.count, 0)
    }
    
    func test_Count_is_One_with_Singe_Insert() throws {
        let list = DoubleLinkedList<Int>()
        list.insert(1)
        XCTAssertEqual(list.count, 1)
    }
    
    func test_Count_is_10000_with_10000_Inserts() throws {
        let list = DoubleLinkedList<Int>()
        
        (1...10000).forEach {
            list.insert($0)
        }
       
        XCTAssertEqual(list.count, 10000)
    }
    
    func test_List_isEmpty_after_remove_all_Elements() throws {
        let list = DoubleLinkedList<Int>()
        
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
        let list = DoubleLinkedList<Int>()
        
        (1...5).forEach {
            list.insert($0)
        }
        
        let countBeforeRemove = list.count
        
        list.remove(99)
        
        let countAfterRemove = list.count
        
        XCTAssertEqual(countBeforeRemove, countAfterRemove)
    }
    
    func test_List_Count_Should_Be_Changed_After_remove_Exist_element() throws {
        let list = DoubleLinkedList<Int>()
        
        (1...5).forEach {
            list.insert($0)
        }
        
        let countBeforeRemove = list.count
        
        list.remove(3)
        
        let countAfterRemove = list.count
        
        XCTAssertEqual(countBeforeRemove - 1, countAfterRemove)
    }
    
    func test_Contains_Should_Be_True_with_Exist_element() throws {
        let list = DoubleLinkedList<Int>()
        
        (1...5).forEach {
            list.insert($0)
        }
        
        XCTAssertTrue(list.contains(3))
    }
    
    func test_Contains_Should_Be_False_with_None_Exist_element() throws {
        let list = DoubleLinkedList<Int>()
        
        (1...5).forEach {
            list.insert($0)
        }
        
        XCTAssertFalse(list.contains(99))
    }
    
    func test_Subscript_Should_Return_Element_of_Index() throws {
        let list = DoubleLinkedList<Int>()
        
        (0...5).forEach {
            list.insert($0)
        }
        
        XCTAssertEqual(list[3], 3)
    }
    
    func test_Subscript_Should_Return_Nil_When_Index_Out_Of_Range() throws {
        let list = DoubleLinkedList<Int>()
        
        (0...5).forEach {
            list.insert($0)
        }
        
        XCTAssertNil(list[6])
    }
    
    func test_first_Should_Return_First_Element() throws {
        let list = DoubleLinkedList<Int>()
        
        (0...5).forEach {
            list.insert($0)
        }
        
        XCTAssertEqual(list.first, 0)
    }
    
    func test_first_Should_Return_Nil_When_List_isEmpty() throws {
        let list = DoubleLinkedList<Int>()
        XCTAssertNil(list.first)
    }
    
    func test_last_Should_Return_Last_Element() throws {
        let list = DoubleLinkedList<Int>()
        
        (0...5).forEach {
            list.insert($0)
        }
        
        XCTAssertEqual(list.last, 5)
    }
    
    func test_last_Should_Return_Nil_When_List_isEmpty() throws {
        let list = DoubleLinkedList<Int>()
        XCTAssertNil(list.last)
    }

}
