//
//  CarPooling.swift
//  Algorithm-Swift
//
//  Created by Xiaojian Duan on 2022/12/27.
//

import Foundation

class CarPoolingSolution {
    func carPooling(_ trips: [[Int]], _ capacity: Int) -> Bool {
        let n = 1001
        var diffArray = Array(repeating: 0, count: n)
        for trip in trips {
            let num = trip[0]
            let from = trip[1]
            let to = trip[2]
            diffArray[from] += num
            if to < n {
                diffArray[to] -= num
            }
        }
        var t = 0
        for num in diffArray {
            let sum = t + num
            if sum > capacity {
                return false
            }
            t = sum
        }
        return true
    }
}
