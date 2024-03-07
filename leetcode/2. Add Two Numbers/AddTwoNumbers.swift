//
//  AddTwoNumbers.swift
//  LeetcodeSwift
//
//  Created by XiaojianDuan on 2024/3/12.
//

import Foundation

class AddTwoNumbersSolution {
    func addTwoNumbers(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
        var p1 = l1, p2 = l2
        var result: ListNode?
        var tail: ListNode?
        var incr: Int = 0
        while p1 != nil || p2 != nil {
            let a = p1 != nil ? p1!.val : 0
            let b = p2 != nil ? p2!.val : 0
            let c = a + b + incr
            let d = c % 10
            incr = c > 9 ? 1 : 0
            let node = ListNode(d, nil)
            if result == nil {
                result = node
                tail = node
            } else {
                if tail != nil {
                    tail!.next = node
                    tail = node
                }
            }
            if p1 != nil {
                p1 = p1!.next
            }
            if p2 != nil {
                p2 = p2!.next
            }
        }
        if incr > 0 {
            let node = ListNode(incr, nil)
            if tail != nil {
                tail!.next = node
            }
        }
        return result
    }
}
