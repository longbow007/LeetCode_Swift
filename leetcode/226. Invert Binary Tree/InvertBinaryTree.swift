//
//  InvertBinaryTree.swift
//  Algorithm-Swift
//
//  Created by Xiaojian Duan on 2023/2/2.
//

import Foundation

class InvertBinaryTreeSolution {
    func invertTree(_ root: TreeNode?) -> TreeNode? {
        guard let root = root else {
            return root
        }
        let left = invertTree(root.left)
        let right = invertTree(root.right)
        root.left = right
        root.right = left
        return root
    }
}
