//
//  HouseRobberII.swift
//  Algorithm-Swift
//
//  Created by Xiaojian Duan on 2022/12/26.
//

import Foundation

class HouseRobberIISolution {
    func robHelper(_ nums: [Int], _ start: Int, _ end: Int) -> Int {
        let n = end - start + 1
        var p = nums[start]
        if n <= 1 {
            return p
        }
        var q = max(nums[start], nums[start + 1])
        for i in start + 2..<end + 1 {
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
        return max(robHelper(nums, 0, n - 2), robHelper(nums, 1, n - 1))
    }
}
