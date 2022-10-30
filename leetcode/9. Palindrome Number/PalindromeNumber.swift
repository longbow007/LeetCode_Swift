//
//  PalindromeNumber.swift
//  Algorithm-Swift
//
//  Created by Xiaojian Duan on 2022/10/29.
//

import Foundation

class PalindromeNumberSolution {
    func isPalindrome(_ x: Int) -> Bool {
        if x < 0 {
            return false
        }
        let s = String(describing: x)
        let arr = Array(s)
        let n = s.count
        var l = (n % 2 == 0) ? n / 2 - 1 : n / 2
        var r = n / 2
        while l >= 0 && r < n && arr[l] == arr[r] {
            l -= 1
            r += 1
        }
        return l == -1 && r == n
    }
}
