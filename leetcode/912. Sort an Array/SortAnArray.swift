//
//  SortAnArray.swift
//  LeetcodeSwift
//
//  Created by XiaojianDuan on 2024/3/7.
//

import Foundation

class SortAnArraySolution {
    func sortArray(_ nums: [Int]) -> [Int] {
        var temp = Array(nums)
        let low = 0, high = nums.count - 1
        quickSort(&temp, low, high)
        return temp
    }

    private func quickSort(_ nums: inout [Int], _ low: Int, _ high: Int) {
        if low >= high {
            return
        }
        let i = partition(&nums, low, high)
        quickSort(&nums, low, i - 1)
        quickSort(&nums, i + 1, high)
    }

    private func partition(_ nums: inout [Int], _ low: Int, _ high: Int) -> Int {
        let randIndex = Int.random(in: low...high)
        let p = nums[randIndex]
        nums.swapAt(low, randIndex)
        var i = low
        for j in (low + 1)...high {
            if nums[j] <= p {
                i += 1
                if i < j {
                    nums.swapAt(i, j)
                }
            }
        }
        nums.swapAt(low, i)
        return i
    }
}

class SortAnArrayTest {
    func run() {
        let array = [5,1,1,2,0,0]
        let sol = SortAnArraySolution()
        let res = sol.sortArray(array)
        print("\(String(describing: res))")
    }
}
