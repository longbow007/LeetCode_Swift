//
//  EvaluateReversePolishNotation.swift
//  Algorithm-Swift
//
//  Created by Xiaojian Duan on 2023/2/2.
//

import Foundation

class EvaluateReversePolishNotationSolution {
    func isDigital(_ s: String) -> Bool {
        var digital = false
        let arr = Array(s)
        for c in arr {
            if c <= "9" && c >= "0" {
                digital = true
            } else {
                digital = false
            }
        }
        return digital
    }
    func stringToNum(_ s: String) -> Int {
        var num = 0
        var start = 0
        var positive = true
        let arr = Array(s)
        if arr[start] == "-" {
            positive = false
            start += 1
        }
        for i in start..<arr.count {
            let c = arr[i]
            let n = c.wholeNumberValue ?? 0
            num = num * 10 + n
        }
        num = positive ? num : -num
        return num
    }
    func evalRPN(_ tokens: [String]) -> Int {
        var stack = [Int]()
        for s in tokens {
            if isDigital(s) {
                let num = stringToNum(s)
                stack.append(num)
                continue
            }
            let b = stack.last ?? 0
            stack.removeLast()
            let a = stack.last ?? 0
            stack.removeLast()
            switch s {
                case "+":
                    stack.append(a + b)
                case "-":
                    stack.append(a - b)
                case "*":
                    stack.append(a * b)
                case "/":
                    stack.append(a / b)
                default:
                    break
            }
        }
        return stack.last ?? 0
    }
}
