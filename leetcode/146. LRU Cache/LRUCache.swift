//
//  LRUCache.swift
//  LeetcodeSwift
//
//  Created by XiaojianDuan on 2024/2/29.
//

import Foundation

class LRUCache {

    class Node {
        var key: Int
        var value: Int
        var next: Node?
        weak var pre: Node?
        init(key: Int, value: Int, next: Node? = nil, pre: Node? = nil) {
            self.key = key
            self.value = value
            self.next = next
            self.pre = pre
        }
    }

    class DoublyLinkedList {
        var head: Node?
        var tail: Node?
        private var count = 0

        var size: Int {
            return count
        }

        func pushFront(_ node: Node) {
            defer {
                count += 1
            }
            if size == 0 {
                head = node
                tail = node
                return
            }
            if size == 1 {
                tail?.pre = node
                node.next = tail
            } else {
                node.next = head
            }
            head?.pre = node
            node.pre = nil
            head = node
        }
        func removeNode(_ node: Node) {
            defer {
                count -= 1
            }
            if node === head {
                head = node.next
                return
            }
            if node === tail {
                tail = node.pre
                return
            }
            let pre = node.pre
            let next = node.next
            node.next = nil
            node.pre = nil
            pre?.next = next
            next?.pre = pre
        }
        func popBack() {
            if size == 0 {
                return
            }
            tail = tail?.pre
            tail?.next = nil
            count -= 1
        }
    }

    private let maxCount: Int

    private let list = DoublyLinkedList()

    private var map = [Int: Node]()

    init(_ capacity: Int) {
        maxCount = capacity
    }

    func get(_ key: Int) -> Int {
        guard let node = map[key] else {
            return -1
        }
        list.removeNode(node)
        list.pushFront(node)
        return node.value
    }

    func put(_ key: Int, _ value: Int) {
        if let node = map[key] {
            list.removeNode(node)
        } else {
            if list.size == maxCount {
                map[list.tail!.key] = nil
                list.popBack()
            }
        }
        let node = Node(key: key, value: value)
        list.pushFront(node)
        map[key] = node
    }
}

extension LRUCache {
    var size: Int {
        return list.size
    }
}
