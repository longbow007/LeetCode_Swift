//
//  LinkedListCycle.swift
//  AlgorithmSwift
//
//  Created by DuanXiaojian on 2025/3/22.
//

import Foundation

class LinkedListCycleSolution {
    func hasCycle(_ head: ListNode?) -> Bool {
        if head == nil || head?.next == nil {
            return false
        }
        // 哈希表法
        var p = head
        var set = Set<ObjectIdentifier>()
        while p != nil {
            let obj = ObjectIdentifier(p!)
            if set.contains(obj) {
                return true
            }
            set.insert(obj)
            p = p?.next
        }
        return false

        // 快慢指针
//        var slow = head, fast = head?.next
//        while slow !== fast {
//            if slow?.next == nil || fast?.next == nil {
//                return false
//            }
//            slow = slow?.next
//            fast = fast?.next?.next
//        }
//        return true
    }
}
