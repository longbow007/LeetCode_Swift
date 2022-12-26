//
//  HouseRobberCircle.swift
//  Algorithm-Swift
//
//  Created by Xiaojian Duan on 2022/12/26.
//

import Foundation

class HouseRobberCircleSolution {
    func robHelper(_ nums: [Int], _ start: Int, _ count: Int) -> Int {
        var p = nums[start]
        if count <= 1 {
            return p
        }
        var q = max(p, nums[start + 1])
        for i in start + 2..<start + count {
            let r = max(p + nums[i], q)
            p = q
            q = r
        }
        return q
    }
    func rob(_ nums: [Int]) -> Int {
        let n = nums.count
        if n <= 1 {
            return nums[0]
        }
        let rob1 = robHelper(nums, 0, n - 1)
        let rob2 = robHelper(nums, 1, n - 1)
        return max(rob1, rob2)
    }
}
