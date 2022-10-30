//
//  ListNode.swift
//  Algorithm-Swift
//
//  Created by Xiaojian Duan on 2022/10/30.
//

import Foundation

public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init() { self.val = 0; self.next = nil; }
    public init(_ val: Int) { self.val = val; self.next = nil; }
    public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next; }
}

func createLinkedList(with array: [Int]) -> ListNode? {
    let n = array.count
    if n == 0 {
        return nil
    }
    var head = ListNode(array[n-1])
    for i in 1..<n {
        let idx = n - i - 1
        let node = ListNode(array[idx], head)
        head = node
    }
    return head
}

func printLinkedList(_ list: ListNode?) {
    var cur: ListNode? = list;
    if cur == nil {
        print("\(String(describing: []))")
        return
    }
    var array: [Int] = []
    while cur != nil {
        array.append(cur!.val)
        cur = cur!.next
    }
    print("\(String(describing: array))")
}
