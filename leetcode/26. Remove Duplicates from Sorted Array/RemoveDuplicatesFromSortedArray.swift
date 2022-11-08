//
//  RemoveDuplicatesFromSortedArray.swift
//  Algorithm-Swift
//
//  Created by Xiaojian Duan on 2022/11/5.
//

import Foundation

class RemoveDuplicatesFromSortedArraySolution {
    func removeDuplicates(_ nums: inout [Int]) -> Int {
        var slow = 0, fast = 0
        while fast < nums.count {
            if nums[slow] != nums[fast] {
                slow += 1
                nums[slow] = nums[fast]
            }
            fast += 1
        }
        return slow + 1
    }
}
