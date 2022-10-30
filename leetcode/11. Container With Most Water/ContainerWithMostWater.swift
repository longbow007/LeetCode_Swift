//
//  ContainerWithMostWater.swift
//  Algorithm-Swift
//
//  Created by Xiaojian Duan on 2022/10/29.
//

import Foundation

class ContainerWithMostWaterSolution {
    func maxArea(_ height: [Int]) -> Int {
        var res: Int = 0
        var i = 0, j = height.count - 1
        while i < j {
            res = max((j - i) * min(height[i], height[j]), res)
            if height[i] < height[j] {
                i += 1
            } else {
                j -= 1
            }
        }
        return res
    }
}
