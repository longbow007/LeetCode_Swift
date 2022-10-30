//
//  LongestPalindromicSubstring.swift
//  Algorithm-Swift
//
//  Created by Xiaojian Duan on 2022/10/29.
//

import Foundation

class LongestPalindromicSubstringSolution {
    // 中心扩散法
    func expand(_ s: [String.Element], _ left: Int, _ right: Int, _ maxLen: inout Int, _ start: inout Int) {
        var l = left, r = right
        while l >= 0 && r < s.count && s[l] == s[r] {
            let len = r - l + 1
            if len > maxLen {
                maxLen = len
                start = l
            }
            l -= 1
            r += 1
        }
    }
    func longestPalindrome(_ s: String) -> String {
        let n = s.count
        if n < 2 {
            return s
        }
        let chars = Array(s)
        var start = 0, maxLen = 1
        for i in 0..<n {
            var l = i, r = i
            expand(chars, l, r, &maxLen, &start)
            l = i
            r = i + 1
            expand(chars, l, r, &maxLen, &start)
        }
        let startIdx = s.index(s.startIndex, offsetBy: start)
        let endIdx = s.index(s.startIndex, offsetBy: start + maxLen)
        let res = String(s[startIdx..<endIdx])
        return res
    }

    // 动态规划
    // func longestPalindrome(_ s: String) -> String {
    //     let n = s.count
    //     if n < 2 {
    //         return s
    //     }
    //     let chars = Array(s)
    //     var dp = Array(repeating: Array(repeating: false, count: n), count: n)
    //     for i in 0..<n {
    //         dp[i][i] = true
    //     }
    //     var start = 0, maxLen = 1
    //     for r in 1..<n {
    //         for l in 0..<r {
    //             let len = r - l + 1
    //             if chars[l] == chars[r] && (len <= 3 || dp[l+1][r-1]) {
    //                 dp[l][r] = true
    //                 if len > maxLen {
    //                     maxLen = len
    //                     start = l
    //                 }
    //             }
    //         }
    //     }
    //     let startIdx = s.index(s.startIndex, offsetBy: start)
    //     let endIdx = s.index(s.startIndex, offsetBy: start + maxLen)
    //     let res = String(s[startIdx..<endIdx])
    //     return res
    // }
}
