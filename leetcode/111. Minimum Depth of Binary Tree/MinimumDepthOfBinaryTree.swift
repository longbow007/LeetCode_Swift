//
//  MinimumDepthOfBinaryTree.swift
//  Algorithm-Swift
//
//  Created by Xiaojian Duan on 2022/11/8.
//

import Foundation

class MinimumDepthOfBinaryTreeSolution {
    func minDepth(_ root: TreeNode?) -> Int {
        if nil == root {
            return 0
        }
        var q: [TreeNode] = []
        var depth = 1
        q.append(root!)
        while !q.isEmpty {
            var size = q.count
            while size > 0 {
                let node = q.first!
                q.removeFirst()
                if node.left == nil && node.right == nil {
                    return depth
                }
                if let l = node.left {
                    q.append(l)
                }
                if let r = node.right {
                    q.append(r)
                }
                size -= 1;
            }
            depth += 1
        }
        return depth
    }
}
