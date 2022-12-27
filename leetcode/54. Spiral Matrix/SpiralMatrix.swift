//
//  SpiralMatrix.swift
//  Algorithm-Swift
//
//  Created by Xiaojian Duan on 2022/12/27.
//

import Foundation

class SpiralMatrixSolution {
     func transMatrix(_ matrix: [[Int]]) -> [[Int]] {
         var res = [[Int]]()
         if matrix.isEmpty {
             return matrix
         }
         let n = matrix[0].count // 列
         let m = matrix.count    // 行
         for j in 0..<n {
             var row = [Int]()
             for i in 0..<m {
                 row.append(matrix[i][n-1-j])
             }
             res.append(row)
         }
         return res
     }
     func spiralOrder(_ matrix: [[Int]]) -> [Int] {
         var mat = matrix
         var res = [Int]()
         while !mat.isEmpty {
             res.append(contentsOf: mat[0])
             mat.removeFirst()
             mat = transMatrix(mat)
         }
         return res
     }

//    func spiralOrder(_ matrix: [[Int]]) -> [Int] {
//        var left = 0, right = matrix[0].count - 1, up = 0, down = matrix.count - 1
//        var res = [Int]()
//        var i = 0, j = 0
//        // 0:right 1:down 2:left 3:up
//        var dir = 0
//        while left <= right && up <= down {
//            res.append(matrix[i][j])
//            switch dir {
//                case 0:
//                    if j == right {
//                        i += 1
//                        up += 1
//                        dir = 1
//                    } else {
//                        j += 1
//                    }
//                case 1:
//                    if i == down {
//                        j -= 1
//                        right -= 1
//                        dir = 2
//                    } else {
//                        i += 1
//                    }
//                case 2:
//                    if j == left {
//                        i -= 1
//                        down -= 1
//                        dir = 3
//                    } else {
//                        j -= 1
//                    }
//                case 3:
//                    if i == up {
//                        j += 1
//                        left += 1
//                        dir = 0
//                    } else {
//                        i -= 1
//                    }
//                default:
//                    break
//            }
//        }
//        return res
//    }
}
