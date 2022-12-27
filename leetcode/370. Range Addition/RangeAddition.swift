//
//  RangeAddition.swift
//  Algorithm-Swift
//
//  Created by Xiaojian Duan on 2022/12/27.
//

import Foundation

class RangeAdditionSolution {
    func getModifiedArray(_ length: Int, _ updates: [[Int]]) -> [Int] {
        var diff = Array(repeating: 0, count: length)
        for update in updates {
            let start = update[0]
            let end = update[1]
            let inc = update[2]
            diff[start] += inc
            if end + 1 < length {
                diff[end+1] -= inc
            }
        }
        var res = Array(repeating: 0, count: length)
        var t = 0
        for i in 0..<length {
            res[i] = t + diff[i]
            t = res[i]
        }
        return res
    }
}
