//
//  SpiralMatrixII.swift
//  Algorithm-Swift
//
//  Created by Xiaojian Duan on 2022/12/27.
//

import Foundation

class SpiralMatrixIISolution {
    func generateMatrix(_ n: Int) -> [[Int]] {
        var val = 1
        var left = 0, right = n - 1, up = 0, down = n - 1
        var res = [[Int]](repeating: [Int](repeating:0, count: n), count: n)
        var i = 0, j = 0
        // 0:right 1:down 2:left 3:up
        var dir = 0
        while left <= right && up <= down {
            res[i][j] = val
            val += 1
            switch dir {
                case 0:
                    if j == right {
                        dir = 1
                        i += 1
                        up += 1
                    } else {
                        j += 1
                    }
                case 1:
                    if i == down {
                        dir = 2
                        j -= 1
                        right -= 1
                    } else {
                        i += 1
                    }
                case 2:
                    if j == left {
                        dir = 3
                        i -= 1
                        down -= 1
                    } else {
                        j -= 1
                    }
                case 3:
                    if i == up {
                        dir = 0
                        j += 1
                        left += 1
                    } else {
                        i -= 1
                    }
                default:
                    break
            }
        }
        return res
    }
}
