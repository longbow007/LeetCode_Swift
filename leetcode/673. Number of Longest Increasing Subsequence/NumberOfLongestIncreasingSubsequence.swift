//
//  NumberOfLongestIncreasingSubsequence.swift
//  Algorithm-Swift
//
//  Created by Xiaojian Duan on 2022/8/23.
//

import Foundation

class numOfLISSolution {
    func findNumberOfLIS(_ nums: [Int]) -> Int {
        if nums.count == 0 {
            return 0
        }
        // 以 i 结尾的子序列的 lis 长度
        var dp: [Int] = Array(repeating: 0, count: nums.count)
        // 长度等于 dp[i] 的子序列的个数
        var cnt: [Int] = Array(repeating: 0, count: nums.count)
        dp[0] = 1
        cnt[0] = 1
        var maxLen = 1
        for i in 1..<nums.count {
            dp[i] = 1
            cnt[i] = 1
            for j in 0..<i {
                if nums[j] < nums[i] {
                    if dp[i] < dp[j] + 1 {
                        dp[i] = dp[j] + 1
                        cnt[i] = cnt[j]
                    } else if dp[i] == dp[j] + 1 {
                        cnt[i] += cnt[j]
                    }
                }
            }
            maxLen = max(maxLen, dp[i])
        }
        // 长度相同的 lis，个数要累加起来
        var result = 0
        for k in 0..<dp.count {
            if maxLen == dp[k] {
                result += cnt[k]
            }
        }
        return result
    }
}
