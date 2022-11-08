//
//  PermutationInString.swift
//  Algorithm-Swift
//
//  Created by Xiaojian Duan on 2022/11/19.
//

import Foundation

class PermutationInStringSolution {
    func checkInclusion(_ s1: String, _ s2: String) -> Bool {
        var need: [Character: Int] = [:]
        let arr1 = Array(s1)
        for c in arr1 {
            need[c] = (need[c] != nil) ? need[c]! + 1 : 1
        }
        let arr2 = Array(s2)
        var window: [Character: Int] = [:]
        var i = 0, valid = 0
        for j in 0..<arr2.count {
            let c = arr2[j]
            if need.keys.contains(c) {
                window[c] = (window[c] != nil) ? window[c]! + 1 : 1
                if need[c] == window[c] {
                    valid += 1
                }
            }
            if j - i >= arr1.count - 1 {
                if valid == need.count {
                    return true
                }
                let d = arr2[i]
                i += 1
                if need.keys.contains(d) {
                    if need[d] == window[d] {
                        valid -= 1
                    }
                    if window[d] != nil {
                        window[d]  = window[d]! - 1
                    }
                }
            }
        }
        return false
    }
}
