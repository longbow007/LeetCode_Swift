//
//  ConstructBinaryTreeFromPreorderAndInorderTraversal.swift
//  Algorithm-Swift
//
//  Created by Xiaojian Duan on 2023/6/13.
//

import Foundation

class ConstructBinaryTreeFromPreorderAndInorderTraversalSolution {
    func buildTree(_ preorder: [Int], _ inorder: [Int]) -> TreeNode? {
        var map = [Int: Int]()
        for i in 0..<inorder.count {
            map[inorder[i]] = i
        }
        return helper(map, preorder, 0, preorder.count - 1, inorder, 0, inorder.count - 1)
    }
    func helper(_ map: [Int: Int], _ preorder: [Int], _ preStart: Int, _ preEnd: Int, _ inorder: [Int], _ inStart: Int, _ inEnd: Int) -> TreeNode? {
        if preStart > preEnd || inStart > inEnd {
            return nil
        }
        let rootVal = preorder[preStart]
        let index = map[rootVal]!
        let leftSize = index - inStart
        var root = TreeNode(rootVal)
        root.left = helper(map, preorder, preStart + 1, preStart + leftSize, inorder, inStart, inStart + leftSize)
        root.right = helper(map, preorder, preStart + leftSize + 1, preEnd, inorder, index + 1, inEnd)
        return root
    }
}
