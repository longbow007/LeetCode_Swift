//
//  RemoveElement.swift
//  Algorithm-Swift
//
//  Created by Xiaojian Duan on 2022/11/5.
//

import Foundation

class RemoveElementSolution {
    func removeElement(_ nums: inout [Int], _ val: Int) -> Int {
        let n = nums.count
        // 常规解法
        // var l = 0
        // for r in 0..<n {
        //     if nums[r] != val {
        //         nums[l] = nums[r]
        //         l += 1
        //     }
        // }
        // return l

        // 双指针
        var slow = 0, fast = 0
        while fast < n {
            if nums[fast] != val {
                nums[slow] = nums[fast]
                slow += 1
            }
            fast += 1
        }
        return slow
    }

    // 解法2
    // func removeElement(_ nums: inout [Int], _ val: Int) -> Int {
    //     if n == 0 {
    //         return 0
    //     }
    //     var l = 0, r = n - 1
    //     for _ in 0...r {
    //         if nums[l] == val {
    //             let c = nums[l]
    //             nums[l] = nums[r]
    //             nums[r] = c
    //             l -= 1
    //             r -= 1
    //         }
    //         l += 1
    //     }
    //     return r + 1
    // }

    // 解法3
    // func removeElement(_ nums: inout [Int], _ val: Int) -> Int {
    //     for l in 0...r {
    //         if nums[l] == val {
    //             while r >= 0 && nums[r] == val {
    //                 r -= 1
    //             }
    //             if l < r {
    //                 let c = nums[l]
    //                 nums[l] = nums[r]
    //                 nums[r] = c
    //                 r -= 1
    //             }
    //         }
    //     }
    //     return r + 1
    // }
}
