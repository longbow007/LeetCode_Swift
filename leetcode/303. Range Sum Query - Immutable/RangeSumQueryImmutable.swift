//
//  RangeSumQueryImmutable.swift
//  Algorithm-Swift
//
//  Created by Xiaojian Duan on 2022/12/27.
//

import Foundation

class NumArray {
    var preSum: [Int]

    init(_ nums: [Int]) {
        let n = nums.count
        preSum = Array(repeating: 0, count: n+1)
        for i in 0..<n {
            preSum[i+1] = preSum[i] + nums[i]
        }
    }
    
    func sumRange(_ left: Int, _ right: Int) -> Int {
        return preSum[right+1] - preSum[left]
    }
}
