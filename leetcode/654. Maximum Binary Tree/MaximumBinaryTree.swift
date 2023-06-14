//
//  MaximumBinaryTree.swift
//  Algorithm-Swift
//
//  Created by Xiaojian Duan on 2023/6/13.
//

import Foundation

class MaximumBinaryTreeSolution {
    func makeTree(_ nums: [Int], _ left: Int, _ right: Int) -> TreeNode? {
        if left > right {
            return nil
        }
        var maxIdx = left
        for i in left...right {
            if nums[i] > nums[maxIdx] {
                maxIdx = i
            }
        }
        var root = TreeNode(nums[maxIdx])
        root.left = makeTree(nums, left, maxIdx-1)
        root.right = makeTree(nums, maxIdx+1, right)
        return root
    }
    func constructMaximumBinaryTree(_ nums: [Int]) -> TreeNode? {
        return makeTree(nums, 0, nums.count - 1)
    }
}
