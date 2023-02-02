//
//  FlattenBinaryTreeToLinkedList.swift
//  Algorithm-Swift
//
//  Created by Xiaojian Duan on 2023/2/2.
//

import Foundation

/**
 * Definition for a binary tree node.
 * public class TreeNode {
 *     public var val: Int
 *     public var left: TreeNode?
 *     public var right: TreeNode?
 *     public init() { self.val = 0; self.left = nil; self.right = nil; }
 *     public init(_ val: Int) { self.val = val; self.left = nil; self.right = nil; }
 *     public init(_ val: Int, _ left: TreeNode?, _ right: TreeNode?) {
 *         self.val = val
 *         self.left = left
 *         self.right = right
 *     }
 * }
 */
class FlattenBinaryTreeToLinkedListSolution {
    // 解法一
    // func makeList(_ root: TreeNode?) -> TreeNode? {
    //     guard let root = root else {
    //         return root
    //     }
    //     var left = root.left
    //     var leftTail = makeList(root.left)
    //     var right = root.right
    //     var rightTail = makeList(root.right)
    //     var p: TreeNode? = root
    //     if let left = left {
    //         p!.left = nil
    //         p!.right = left
    //         p = p!.right
    //     }
    //     if let lt = leftTail {
    //         p = lt
    //         p!.left = nil
    //         p!.right = nil
    //     }
    //     if let right = right {
    //         p!.right = right
    //         p = p!.right
    //         p!.left = nil
    //     }
    //     if let rt = rightTail {
    //         p = rt
    //         p!.left = nil
    //         p!.right = nil
    //     }
    //     return p
    // }
    // func flatten(_ root: TreeNode?) {
    //     makeList(root)
    // }

    // 解法二
    private var pre: TreeNode? = nil
    func flatten(_ root: TreeNode?) {
        guard let root = root else {
            return
        }
        flatten(root.right)
        flatten(root.left)
        root.left = nil
        root.right = pre
        pre = root
    }
}
