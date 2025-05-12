//
//  ReverseLinkedListII.swift
//  AlgorithmSwift
//
//  Created by DuanXiaojian on 2025/3/22.
//

import Foundation

class ReverseLinkedListIISolution {
    var successor: ListNode? = nil

    func reverseN(_ head: ListNode?, _ n: Int) -> ListNode? {
        if n == 1 {
            successor = head?.next
            return head
        }
        let last = reverseN(head?.next, n - 1)
        head?.next?.next = head
        head?.next = successor
        return last
    }

    func reverseBetween(_ head: ListNode?, _ left: Int, _ right: Int) -> ListNode? {
        if left == 1 {
            return reverseN(head, right)
        }
        head?.next = reverseBetween(head?.next, left - 1, right - 1)
        return head
    }
}

