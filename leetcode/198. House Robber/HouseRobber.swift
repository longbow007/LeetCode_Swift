//
//  HouseRobber.swift
//  Algorithm-Swift
//
//  Created by Xiaojian Duan on 2022/12/26.
//

import Foundation

class HouseRobberSolution {
    func rob(_ nums: [Int]) -> Int {
        let n = nums.count
        var p = nums[0]
        if n <= 1 {
            return p
        }
        var q = max(nums[0], nums[1])
        for i in 2..<n {
            let r = max(p + nums[i], q)
            p = q
            q = r
        }
        return q
    }
}
