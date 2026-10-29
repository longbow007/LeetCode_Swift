//
//  LongestConsecutiveSequence.swift
//  MyTool
//
//  Created by DuanXiaojian on 2026/10/15.
//

import Foundation

class LongestConsecutiveSequenceSolution {
    func longestConsecutive(_ nums: [Int]) -> Int {
        let numsSet = Set(nums)
        var len = 0
        
        for num in numsSet {
            if numsSet.contains(num - 1) {
                continue
            }
            // 当前的最大长度
            var l = 1
            var cur = num
            while numsSet.contains(cur + 1) {
                l += 1
                cur += 1
            }
            len = max(len, l)
        }
        return len
    }
}
