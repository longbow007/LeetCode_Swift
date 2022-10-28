//
//  MaximumSubarray.swift
//  Algorithm-Swift
//
//  Created by Xiaojian Duan on 2022/8/23.
//

import Foundation

class MaximumSubarraySolution {
    func maxSubArray(_ nums: [Int]) -> Int {
        if nums.count == 1 {
            return nums[0]
        }
        var dp = nums[0]
        var result = dp
        for i in 1..<nums.count {
            dp = max(dp + nums[i], nums[i])
            result = max(dp, result)
        }
        return result
    }

    /// 这个还加了打印
    func maxSubArray2(_ nums: [Int]) -> Int {
        if nums.count == 1 {
            return nums[0]
        }
        var dp = nums[0]
        var result = dp
        var l = 0, r = 0
        for i in 1..<nums.count {
            dp = max(dp + nums[i], nums[i])
            result = max(dp, result)
            if dp < 0 {
                l = i
                r = i
            }
            if nums[i] > 0 {
                r = i
            }
        }
        print(String(describing: nums[l...r]))
        return result
    }
}
