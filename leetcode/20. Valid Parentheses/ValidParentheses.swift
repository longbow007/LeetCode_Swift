//
//  ValidParentheses.swift
//  Algorithm-Swift
//
//  Created by Xiaojian Duan on 2022/10/30.
//

import Foundation

class ValidParenthesesSolution {
    func parenthesesesPaired(_ c1: Character, _ c2: Character) -> Bool {
        if c1 == "(" {
            return c2 == ")"
        }
        if c1 == "[" {
            return c2 == "]"
        }
        if c1 == "{" {
            return c2 == "}"
        }
        return false
    }
    func isValid(_ s: String) -> Bool {
        let n = s.count
        if n % 2 != 0 {
            return false
        }
        let chs = Array(s)
        var stack: [Character] = []
        for c in chs {
            if stack.isEmpty {
                stack.append(c)
                continue
            }
            let a = stack.last!
            if parenthesesesPaired(a, c) {
                stack.removeLast()
            } else {
                stack.append(c)
            }
        }
        return stack.isEmpty
    }
}
