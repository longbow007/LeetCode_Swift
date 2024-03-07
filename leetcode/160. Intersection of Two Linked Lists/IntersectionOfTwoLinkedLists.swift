//
//  IntersectionOfTwoLinkedLists.swift
//  LeetcodeSwift
//
//  Created by XiaojianDuan on 2024/3/7.
//

import Foundation

//class IntersectionOfTwoLinkedListsSolution {
//    func getIntersectionNode(_ headA: ListNode?, _ headB: ListNode?) -> ListNode? {
//        var p = headA, q = headB
//        var pChanged = false, qChanged = false
//        while p !== q {
//            p = p?.next
//            if p == nil && !pChanged {
//                p = headB
//                pChanged = true
//            }
//            q = q?.next
//            if q == nil && !qChanged {
//                q = headA
//                qChanged = true
//            }
//        }
//        return p
//    }
//}

class IntersectionOfTwoLinkedListsSolution {
    func getIntersectionNode(_ headA: ListNode?, _ headB: ListNode?) -> ListNode? {
        var hashSet = Set<ListNode>()
        var p = headA
        while p != nil {
            hashSet.insert(p!)
            p = p?.next
        }
        var q = headB
        while q != nil {
            if hashSet.contains(q!) {
                return q
            }
            q = q?.next
        }
        return nil
    }
}

extension ListNode: Hashable {
    public func hash(into hasher: inout Hasher) {
        hasher.combine(ObjectIdentifier(self))
    }

    public static func == (lhs: ListNode, rhs: ListNode) -> Bool {
        return ObjectIdentifier(lhs) == ObjectIdentifier(rhs)
    }
}
