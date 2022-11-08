//
//  MergeTwoSortedLists.swift
//  Algorithm-Swift
//
//  Created by Xiaojian Duan on 2022/10/30.
//

import Foundation

class MergeTwoSortedListsSolution {
    func mergeTwoLists(_ list1: ListNode?, _ list2: ListNode?) -> ListNode? {
        if list1 == nil {
            return list2
        }
        if list2 == nil {
            return list1
        }
        var result = ListNode(-1)
        var p = result
        var l1 = list1, l2 = list2
        while (l1 != nil && l2 != nil) {
            if l1!.val > l2!.val {
                p.next = l2
                l2 = l2!.next
            } else {
                p.next = l1
                l1 = l1!.next
            }
            p = p.next!
        }
        p.next = (l1 != nil) ? l1 : l2
        result = result.next!
        return result
    }
}
