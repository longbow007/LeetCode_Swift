//
//  SpiralOrder.swift
//  Algorithm-Swift
//
//  Created by Xiaojian Duan on 2022/12/26.
//

import Foundation

class SpiralOrderSolution {
    func spiralOrder(_ matrix: [[Int]]) -> [Int] {
        var res = [Int]()
        if matrix.isEmpty {
            return res
        }
        let m = matrix.count // 行数
        let n = matrix[0].count // 列数
        var top = 0, left = 0, right = n - 1, bottom = m - 1
        while top <= bottom && left <= right {
            // 向右
            for i in left...right {
                res.append(matrix[top][i])
            }
            top += 1
            if top > bottom {
                break
            }
            // 向下
            for i in top...bottom {
                res.append(matrix[i][right])
            }
            right -= 1
            if right < left {
                break
            }
            // 向左
            for i in 0...right-left {
                res.append(matrix[bottom][right - i])
            }
            bottom -= 1
            if bottom < top {
                break
            }
            // 向上
            for i in 0...bottom-top {
                res.append(matrix[bottom - i][left])
            }
            left += 1
            if left > right {
                break
            }
        }
        return res
    }
}
