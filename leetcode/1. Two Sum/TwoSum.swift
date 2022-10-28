//
//  TwoSum.swift
//  Algorithm-Swift
//
//  Created by Xiaojian Duan on 2022/10/28.
//

import Foundation

class TwoSumSolution {
    func twoSum(_ nums: [Int], _ target: Int) -> [Int] {
        var res: [Int] = []
        var map: [Int: Int] = [:]
        for i in 0..<nums.count {
            let x = nums[i]
            let y = target - x
            if let j = map[y] {
                res.append(j)
                res.append(i)
                return res
            }
            map[x] = i
        }
        return res
    }
}
