//
//  MoveZeroes.swift
//  Algorithm-Swift
//
//  Created by Xiaojian Duan on 2022/11/6.
//

import Foundation

class MoveZeroesSolution {
    func moveZeroes(_ nums: inout [Int]) {
        let n = nums.count
        var l = 0, r = 0
        while r < n {
            if nums[r] != 0 {
                let temp = nums[l]
                nums[l] = nums[r]
                nums[r] = temp
                l += 1
            }
            r += 1
        }
    }
}
