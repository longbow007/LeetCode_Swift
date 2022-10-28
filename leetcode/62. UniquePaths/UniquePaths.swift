//
//  UniquePaths.swift
//  Algorithm-Swift
//
//  Created by Xiaojian Duan on 2022/8/21.
//

import Foundation

struct Matrix<T> {
    let rows: Int
    let columns: Int
    var elements: [T]
    init(repeating value: T, rows: Int, columns: Int) {
        let r = rows > 0 ? rows : 0
        let c = columns > 0 ? columns : 0
        self.rows = r
        self.columns = c
        self.elements = Array(repeating: value, count: self.rows * self.columns)
    }
    subscript(row: Int, column: Int) -> T {
        get {
            elements[self.columns * row + column]
        }
        set {
            elements[self.columns * row + column] = newValue
        }
    }
}

func uniquePaths(_ m: Int, _ n: Int) -> Int {
    if m <= 0 || n <= 0 {
        return 0
    }
    var mat: Matrix<Int> = Matrix(repeating: 0, rows: m, columns: n)
    for i in 0..<m {
        mat[i, 0] = 1
    }
    for j in 0..<n {
        mat[0, j] = 1
    }
    for i in 1..<m {
        for j in 1..<n {
            mat[i, j] = mat[i-1, j] + mat[i, j-1]
        }
    }
    return mat[m-1, n-1]
}
