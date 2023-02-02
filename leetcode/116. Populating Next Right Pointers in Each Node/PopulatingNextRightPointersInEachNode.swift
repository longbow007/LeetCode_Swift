//
//  PopulatingNextRightPointersInEachNode.swift
//  Algorithm-Swift
//
//  Created by Xiaojian Duan on 2023/2/2.
//

import Foundation

// Definition for a Node.
public class Node {
    public var val: Int
    public var left: Node?
    public var right: Node?
    public var next: Node?
    public init(_ val: Int) {
        self.val = val
        self.left = nil
        self.right = nil
        self.next = nil
    }
}
 

class PopulatingNextRightPointersInEachNodeSolution {
    func traverse(_ n1: Node?, _ n2: Node?) {
        guard let n1 = n1, let n2 = n2 else {
            return
        }
        n1.next = n2
        traverse(n1.left, n1.right)
        traverse(n2.left, n2.right)
        traverse(n1.right, n2.left)
    }
    func connect(_ root: Node?) -> Node? {
        guard let root = root else {
            return root
        }
        traverse(root.left, root.right)
        return root
    }
}
