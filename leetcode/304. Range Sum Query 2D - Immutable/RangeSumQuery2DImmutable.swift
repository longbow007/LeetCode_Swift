//
//  RangeSumQuery2DImmutable.swift
//  Algorithm-Swift
//
//  Created by Xiaojian Duan on 2022/12/27.
//

import Foundation

class NumMatrix {
    var preSum: [[Int]]
    init(_ matrix: [[Int]]) {
        let m = matrix.count // 行数
        let n = matrix[0].count // 列数
        preSum = Array(repeating: Array(repeating: 0, count: n+1), count: m+1)
        for i in 0..<m {
            for j in 0..<n {
                preSum[i+1][j+1] = preSum[i][j+1] + preSum[i+1][j] + matrix[i][j] - preSum[i][j]
            }
        }
    }
    
    func sumRegion(_ row1: Int, _ col1: Int, _ row2: Int, _ col2: Int) -> Int {
        return preSum[row2+1][col2+1] - preSum[row2+1][col1] - preSum[row1][col2+1] + preSum[row1][col1]
    }
}
