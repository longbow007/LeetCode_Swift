//
//  TwoSumII.swift
//  Algorithm-Swift
//
//  Created by Xiaojian Duan on 2022/11/5.
//

import Foundation

class TwoSumIISolution {
    func twoSum(_ numbers: [Int], _ target: Int) -> [Int] {
        var l = 0, r = numbers.count - 1
        while l < r {
            let sum = numbers[l] + numbers[r]
            if sum == target {
                return [l+1, r+1]
            } else if sum < target {
                l += 1
            } else {
                r -= 1
            }
        }
        return []
    }
}
