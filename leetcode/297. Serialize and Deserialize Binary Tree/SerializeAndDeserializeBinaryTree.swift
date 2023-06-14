//
//  SerializeAndDeserializeBinaryTree.swift
//  Algorithm-Swift
//
//  Created by Xiaojian Duan on 2023/6/13.
//

import Foundation

class Codec {
    private var resArray: [String] = []
    private var idx = 0

    func serialize(_ root: TreeNode?) -> String {
        preorderTraverse(root)
        let res = resArray.joined(separator: ",")
        // print("\(res)")
        return res
    }

    func preorderTraverse(_ node: TreeNode?) {
        guard let node = node else {
            self.resArray.append("#")
            return
        }
        let strVal = String(describing: node.val)
        resArray.append(strVal)
        preorderTraverse(node.left)
        preorderTraverse(node.right)
    }
    
    func deserialize(_ data: String) -> TreeNode? {
        let arr = data.components(separatedBy: ",")
        return dfs(arr)
    }

    func dfs(_ arr: [String]) -> TreeNode? {
        if arr.isEmpty {
            return nil
        }
        let str = arr[idx]
        if str == "#" {
            idx += 1
            return nil
        }
        let val = Int(str) ?? 0
        idx += 1
        var node = TreeNode(val)
        node.left = dfs(arr)
        node.right = dfs(arr)
        return node
    }
}
