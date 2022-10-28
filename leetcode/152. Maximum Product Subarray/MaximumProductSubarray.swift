//
//  MaximumProductSubarray.swift
//  Algorithm-Swift
//
//  Created by Xiaojian Duan on 2022/8/26.
//

import Foundation

class MaximumProductSubarraySolution {
    func maxProduct(_ nums: [Int]) -> Int {
        var maxVal = nums[0], minVal = maxVal, res = maxVal
        for i in 1..<nums.count {
            let an = nums[i], tempMax = maxVal * an, tempMin = minVal * an
            maxVal = max(tempMax, max(tempMin, an))
            minVal = min(tempMin, min(tempMax, an))
            res = max(res, maxVal)
        }
        return res
    }
}
