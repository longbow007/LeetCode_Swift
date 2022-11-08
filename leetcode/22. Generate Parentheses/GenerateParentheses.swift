//
//  GenerateParentheses.swift
//  Algorithm-Swift
//
//  Created by Xiaojian Duan on 2022/11/1.
//

import Foundation

class GenerateParenthesesSolution {
//    func dfs(_ ans: inout [String], _ cur: inout [Character], _ n: Int, _ left: Int, _ right: Int) {
//        if left == n && right == n {
//            let s = String(cur)
//            ans.append(s)
//            return
//        }
//        if left < n {
//            cur.append("(")
//            dfs(&ans, &cur, n, left + 1, right)
//            cur.removeLast()
//        }
//        if right < left {
//            cur.append(")")
//            dfs(&ans, &cur, n, left, right + 1)
//            cur.removeLast()
//        }
//    }
    func dfs(_ ans: inout [String], _ cur: inout [Character], _ n: Int, _ left: Int, _ right: Int) {
        if left < right || left > n || right > n {
            return
        }
        if left == n && right == n {
            let s = String(cur)
            ans.append(s)
            return
        }
        cur.append("(")
        dfs(&ans, &cur, n, left + 1, right)
        cur.removeLast()
        cur.append(")")
        dfs(&ans, &cur, n, left, right + 1)
        cur.removeLast()
    }
    
    func generateParenthesis(_ n: Int) -> [String] {
        var ans = [String]()
        var cur = [Character]()
        dfs(&ans, &cur, n, 0, 0)
        return ans
    }
}
