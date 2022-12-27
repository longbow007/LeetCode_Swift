//
//  RotateImage.swift
//  Algorithm-Swift
//
//  Created by Xiaojian Duan on 2022/12/27.
//

import Foundation

class RotateImageSolution {
    func swap(_ matrix: inout [[Int]], _ i: Int, _ j: Int, _ k: Int, _ l: Int) {
        let temp = matrix[i][j]
        matrix[i][j] = matrix[k][l]
        matrix[k][l] = temp
    }
    func rotate(_ matrix: inout [[Int]]) {
        let n = matrix.count
        for i in 0..<n {
            for j in 0..<i {
                swap(&matrix, i, j, j, i)
            }
        }
        for i in 0..<n/2 {
            for j in 0..<n {
                swap(&matrix, j, i, j, n - i - 1)
            }
        }
    }
}
