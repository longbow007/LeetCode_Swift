//
//  LongestIncreasingSubsequence.swift
//  Algorithm-Swift
//
//  Created by Xiaojian Duan on 2022/8/22.
//

import Foundation

class LISSolution {
    func lengthOfLIS(_ nums: [Int]) -> Int {
        if nums.count == 0 {
            return 0
        }
        var dp = Array(repeating: 0, count: nums.count)
        dp[0] = 1
        var len = 1
        // 注意 i 从 1 开始
        for i in 1..<nums.count {
            dp[i] = 1
            for j in 0..<i {
                if nums[j] < nums[i] {
                    dp[i] = max(dp[i], dp[j] + 1)
                }
            }
            len = max(len, dp[i])
        }
        return len
    }
}
