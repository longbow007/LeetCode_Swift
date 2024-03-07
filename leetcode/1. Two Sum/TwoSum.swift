//
//  TwoSum.swift
//  Algorithm-Swift
//
//  Created by Xiaojian Duan on 2022/10/28.
//

import Foundation

class TwoSumSolution {
    func twoSum(_ nums: [Int], _ target: Int) -> [Int] {
        var map: [Int: Int] = [:]
        for (i, num) in nums.enumerated() {
            let m = target - num
            if let j = map[m] {
                return [i, j]
            }
            map[num] = i
        }
        return []
    }
}
