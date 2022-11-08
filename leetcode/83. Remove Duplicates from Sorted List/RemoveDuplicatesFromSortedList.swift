//
//  RemoveDuplicatesFromSortedList.swift
//  Algorithm-Swift
//
//  Created by Xiaojian Duan on 2022/11/5.
//

import Foundation

class RemoveDuplicatesFromSortedListSolution {
    func deleteDuplicates(_ head: ListNode?) -> ListNode? {
        if head == nil || head?.next == nil {
            return head
        }
        var slow = head, fast = head
        while fast != nil {
            if slow?.val != fast?.val {
                slow?.next = fast
                slow = slow?.next
            }
            fast = fast?.next
        }
        slow?.next = nil
        return head;
    }
}
