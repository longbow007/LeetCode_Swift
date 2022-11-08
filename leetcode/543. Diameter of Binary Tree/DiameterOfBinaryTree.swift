//
//  DiameterOfBinaryTree.swift
//  Algorithm-Swift
//
//  Created by Xiaojian Duan on 2022/11/7.
//

import Foundation

class DiameterOfBinaryTreeSolution {
    @discardableResult func dfs(_ node: TreeNode?, _ maxDepth: inout Int) -> Int {
        if nil == node {
            return 0
        }
        let l = dfs(node?.left, &maxDepth)
        let r = dfs(node?.right, &maxDepth)
        maxDepth = max(maxDepth, l + r)
        return max(l, r) + 1
    }
    func diameterOfBinaryTree(_ root: TreeNode?) -> Int {
        var res = 0
        dfs(root, &res)
        return res
    }
}
