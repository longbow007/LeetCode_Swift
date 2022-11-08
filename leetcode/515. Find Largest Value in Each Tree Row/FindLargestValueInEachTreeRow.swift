//
//  FindLargestValueInEachTreeRow.swift
//  Algorithm-Swift
//
//  Created by Xiaojian Duan on 2022/11/7.
//

import Foundation

class FindLargestValueInEachTreeRowSolution {
    func largestValues(_ root: TreeNode?) -> [Int] {
        var ans: [Int] = [];
        if nil == root {
            return ans
        }
        var q: [TreeNode] = []
        q.append(root!)
        while !q.isEmpty {
            var size = q.count
            var maxVal = q.first!.val
            while size > 0 {
                let n = q.first!
                q.removeFirst()
                maxVal = max(maxVal, n.val)
                if let ln = n.left {
                    q.append(ln)
                }
                if let rn = n.right {
                    q.append(rn)
                }
                size -= 1
            }
            ans.append(maxVal)
        }
        return ans
    }
}
