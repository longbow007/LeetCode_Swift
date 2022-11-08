//
//  BinaryTreeMaximumPathSum.swift
//  Algorithm-Swift
//
//  Created by Xiaojian Duan on 2022/11/7.
//

import Foundation

class BinaryTreeMaximumPathSumSolution {
    @discardableResult func dfs(_ node: TreeNode?, _ maxSum: inout Int) -> Int {
        guard let node = node else {
            return 0
        }
        let l = max(0, dfs(node.left, &maxSum))
        let r = max(0, dfs(node.right, &maxSum))
        maxSum = max(maxSum, l + r + node.val)
        return max(l, r) + node.val
    }
    func maxPathSum(_ root: TreeNode?) -> Int {
        var maxSum = Int.min
        dfs(root, &maxSum)
        return maxSum
    }
}
