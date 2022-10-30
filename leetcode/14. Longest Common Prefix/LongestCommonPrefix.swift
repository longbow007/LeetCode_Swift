//
//  LongestCommonPrefix.swift
//  Algorithm-Swift
//
//  Created by Xiaojian Duan on 2022/10/29.
//

import Foundation

class LongestCommonPrefixSolution {
    func longestCommonPrefix(_ strs: [String]) -> String {
        let n = strs.count
        if n < 2 {
            return strs[0]
        }
        var res = ""
        var i = 0
        var stop = false
        while !stop {
            let s0 = strs[0]
            if i >= s0.count {
                stop = true
                break
            }
            let c0 = s0[s0.index(s0.startIndex, offsetBy: i)]
            for j in 1..<n {
                let sj = strs[j]
                if i >= sj.count {
                    stop = true
                    break
                }
                let cj = sj[sj.index(sj.startIndex, offsetBy: i)]
                if c0 != cj {
                    stop = true
                    break
                }
            }
            if !stop {
                res += String(c0)
            }
            i += 1
        }
        return res
    }
}
