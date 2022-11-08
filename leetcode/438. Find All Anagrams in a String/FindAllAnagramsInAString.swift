//
//  FindAllAnagramsInAString.swift
//  Algorithm-Swift
//
//  Created by Xiaojian Duan on 2022/11/19.
//

import Foundation

class FindAllAnagramsInAStringSolution {
    func findAnagrams(_ s: String, _ p: String) -> [Int] {
        var need: [Character: Int] = [:]
        let pArr = Array(p)
        for c in pArr {
            need[c] = (need[c] != nil) ? need[c]! + 1 : 1
        }
        var window: [Character: Int] = [:]
        var left = 0, valid = 0
        var res: [Int] = []
        let sArr = Array(s)
        for right in 0..<sArr.count {
            let c = sArr[right]
            if need[c] != nil {
                window[c] = (window[c] != nil) ? window[c]! + 1 : 1
                if window[c] == need[c] {
                    valid += 1
                }
            }
            if right - left >= pArr.count - 1 {
                if valid == need.count {
                    res.append(left)
                }
                let d = sArr[left]
                left += 1
                if need[d] != nil {
                    if window[d] == need[d] {
                        valid -= 1
                    }
                    if (window[d] != nil) {
                        window[d] =  window[d]! - 1
                    }
                }
            }
        }
        return res
    }
}
