//
//  RemoveNthNodeFromEndOfList.swift
//  Algorithm-Swift
//
//  Created by Xiaojian Duan on 2022/10/30.
//

import Foundation

class RemoveNthNodeFromEndOfListSolution {
    func removeNthFromEnd(_ head: ListNode?, _ n: Int) -> ListNode? {
        var p: ListNode? = head, q: ListNode? = p
        for _ in 0..<n {
            p = p?.next
        }
        guard var p = p else {
            return head?.next
        }
        while p.next != nil {
            p = p.next!
            q = q?.next
        }
        q?.next = q?.next?.next
        return head
    }
}
