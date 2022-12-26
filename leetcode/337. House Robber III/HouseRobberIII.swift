//
//  HouseRobberIII.swift
//  Algorithm-Swift
//
//  Created by Xiaojian Duan on 2022/12/26.
//

import Foundation

class HouseRobberIIISolution {
    // 返回值第一个元素是包含 root 节点的抢劫最大值，第二个元素是不包含 root 节点的抢劫最大值
    func dfs(_ root: TreeNode?) -> [Int] {
        var res = [0, 0]
        if root == nil {
            return res
        }
        let left = dfs(root!.left)
        let right = dfs(root!.right)
        res[0] = root!.val + left[1] + right[1]
        res[1] = max(left[0], left[1]) + max(right[0], right[1])
        return res
    }
    func rob(_ root: TreeNode?) -> Int {
        let res = dfs(root)
        return max(res[0], res[1])
    }
}
