//
//  ConstructBinaryTreeFromInorderAndPostorderTraversal.swift
//  Algorithm-Swift
//
//  Created by Xiaojian Duan on 2023/6/13.
//

import Foundation

class ConstructBinaryTreeFromInorderAndPostorderTraversalSolution {
    func buildTree(_ inorder: [Int], _ postorder: [Int]) -> TreeNode? {
        var map = [Int: Int]()
        for i in 0..<inorder.count {
            map[inorder[i]] = i
        }
        return helper(map, inorder, 0, inorder.count - 1, postorder, 0, postorder.count - 1)
    }
    func helper(_ map: [Int: Int], _ inorder: [Int], _ inStart: Int, _ inEnd: Int, _ postorder: [Int], _ postStart: Int, _ postEnd: Int) -> TreeNode? {
        if inStart > inEnd || postStart > postEnd {
            return nil
        }
        let rootVal = postorder[postEnd]
        let index = map[rootVal]!
        let leftSize = index - inStart
        var root = TreeNode(rootVal)
        root.left = helper(map, inorder, inStart, index - 1, postorder, postStart, postStart + leftSize - 1)
        root.right = helper(map, inorder, index + 1, inEnd, postorder, postStart + leftSize, postEnd - 1)
        return root
    }
}
