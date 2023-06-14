//
//  SymmetricTree.swift
//  Algorithm-Swift
//
//  Created by Xiaojian Duan on 2023/6/13.
//

import Foundation

class SymmetricTree {
    // 递归解法
    func checkSymetric(left l: TreeNode?, right r: TreeNode?) -> Bool {
        if l != nil && r != nil {
            return l!.val == r!.val && checkSymetric(left: l?.left, right: r?.right) && checkSymetric(left: l?.right, right: r?.left)
        }
        if l == nil && r == nil {
            return true
        }
        return false
    }

    func isSymmetric(_ root: TreeNode?) -> Bool {
        return checkSymetric(left: root?.left, right: root?.right)
    }
    // 队列解法
//    private var queue = [TreeNode]()
//
//    func isSymmetric(_ root: TreeNode?) -> Bool {
//        if root?.left == nil && root?.right == nil {
//            return true
//        }
//        guard let l = root?.left, let r =  root?.right else {
//            return false
//        }
//        queue.append(l)
//        queue.append(r)
//        while !queue.isEmpty {
//            let left = queue.first!
//            queue.removeFirst()
//            if queue.isEmpty {
//                return false
//            }
//            let right = queue.first!
//            queue.removeFirst()
//            if left.val != right.val {
//                return false
//            }
//            if !checkPair(left: left.left, right: right.right) {
//                return false
//            }
//            if !checkPair(left: left.right, right: right.left) {
//                return false
//            }
//        }
//        return true
//    }
//
//    func checkPair(left l: TreeNode?, right r: TreeNode?) -> Bool {
//        if l != nil && r != nil {
//            queue.append(l!)
//            queue.append(r!)
//            return true
//        }
//        if l == nil && r == nil {
//            return true
//        }
//        return false
//    }
}
