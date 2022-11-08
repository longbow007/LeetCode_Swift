//
//  MergeKSortedLists.swift
//  Algorithm-Swift
//
//  Created by Xiaojian Duan on 2022/11/2.
//

import Foundation

class MergeKSortedListsSolution {
//    func mergeTwoLists(_ list1: ListNode?, _ list2: ListNode?) -> ListNode? {
//        if list1 == nil {
//            return list2
//        }
//        if list2 == nil {
//            return list1
//        }
//        var result = ListNode(-1)
//        var p = result
//        var l1 = list1, l2 = list2
//        while (l1 != nil && l2 != nil) {
//            if l1!.val > l2!.val {
//                p.next = l2
//                l2 = l2!.next
//            } else {
//                p.next = l1
//                l1 = l1!.next
//            }
//            p = p.next!
//        }
//        p.next = (l1 != nil) ? l1 : l2
//        result = result.next!
//        return result
//    }
//
//    func merge(_ lists: [ListNode?], _ low: Int, _ high: Int) -> ListNode? {
//        if low > high {
//            return nil
//        }
//        if low == high {
//            return lists[low]
//        }
//        let mid = (low + high) / 2
//        return mergeTwoLists(merge(lists, low, mid), merge(lists, mid+1, high))
//    }
//    func mergeKLists(_ lists: [ListNode?]) -> ListNode? {
//        let n = lists.count
//        if n == 0 {
//            return nil
//        }
//        if n == 1 {
//            return lists[0]
//        }
//        if n == 2 {
//            return mergeTwoLists(lists[0], lists[1])
//        }
//        return merge(lists, 0, n - 1)
//    }
    
    func mergeKLists(_ lists: [ListNode?]) -> ListNode? {
        var pq = PriorityQueue<ListNode> { node1, node2 in
            return node1.val > node2.val
        }
        for head in lists {
            if head != nil {
                pq.enqueue(head!)
            }
        }
        var temp = ListNode(-1, nil)
        var p: ListNode? = temp
        while !pq.isEmpty {
            let node = pq.dequeue()
            p?.next = node
            p = p?.next
            let q = node?.next
            if q != nil {
                pq.enqueue(q!)
            }
        }
        return temp.next
    }
}
