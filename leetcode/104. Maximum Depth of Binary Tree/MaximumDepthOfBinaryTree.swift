//
//  MaximumDepthOfBinaryTree.swift
//  Algorithm-Swift
//
//  Created by Xiaojian Duan on 2022/11/7.
//

import Foundation

class MaximumDepthOfBinaryTreeSolution {
    // func dfs(_ node: TreeNode?, _ depth: inout Int, _ res: inout Int) {
    //     if nil == node {
    //         return
    //     }
    //     depth += 1
    //     if nil == node?.left && nil == node?.right {
    //         res = max(res, depth)
    //     }
    //     dfs(node?.left, &depth, &res)
    //     dfs(node?.right, &depth, &res)
    //     depth -= 1
    // }
    // func maxDepth(_ root: TreeNode?) -> Int {
    //     var depth = 0, res = 0
    //     dfs(root, &depth, &res)
    //     return res
    // }

    func maxDepth(_ root: TreeNode?) -> Int {
        if nil == root {
            return 0
        }
        return max(maxDepth(root?.left), maxDepth(root?.right)) + 1
    }
}
