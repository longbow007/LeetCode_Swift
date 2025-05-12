//
//  ReverseLinkedList.swift
//  AlgorithmSwift
//
//  Created by DuanXiaojian on 2025/3/22.
//

import Foundation

class ReverseLinkedListSolution {
    func reverseList(_ head: ListNode?) -> ListNode? {
        if head == nil || head?.next == nil {
            return head
        }
        // 递归法
//        var p = reverseList(head?.next)
//        head?.next?.next = head
//        head?.next = nil
//        return p

        // 指针法
        var p = head!, q = p.next
        p.next = nil
        while q != nil {
            let r = q!.next
            q!.next = p
            p = q!
            q = r
        }
        return p
    }
}
