//
//  ThreeSumClosest.swift
//  Algorithm-Swift
//
//  Created by Xiaojian Duan on 2022/10/30.
//

import Foundation

class ThreeSumClosestSolution {
    func threeSumClosest(_ nums: [Int], _ target: Int) -> Int {
        let n = nums.count
        let sorted = nums.sorted()
        var minDiff: Int?
        var res = 0
        for i in 0..<n {
            var j = i + 1, k = n - 1
            while j < k {
                let sum = sorted[i] + sorted[j] + sorted[k]
                if sum == target {
                    return sum;
                }
                let diff = abs(sum - target)
                if minDiff == nil || minDiff! > diff {
                    minDiff = diff
                    res = sum
                }
                if sum > target {
                    k -= 1
                } else {
                    j += 1
                }
            }
        }
        return res
    }
}
