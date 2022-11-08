//
//  MonkeySort.swift
//  Algorithm-Swift
//
//  Created by Xiaojian Duan on 2022/11/1.
//

import Foundation

// 试试传说中的“猴排”😂
func monkeySort(_ array: inout [Int]) {
    let isSorted: ([Int]) -> Bool = { arr in
        if arr.count < 2 {
            return true
        }
        var x = arr[0]
        for i in 1..<arr.count {
            let y = arr[i]
            if y < x {
                return false
            }
            x = y
        }
        return true
    }
    let sortArray: (inout [Int]) -> Void = { arr in
        let i = Int.random(in: 0..<arr.count)
        var j = Int.random(in: 0..<arr.count)
        while i == j {
            j = Int.random(in: 0..<arr.count)
        }
        let temp = arr[i]
        arr[i] = arr[j]
        arr[j] = temp
    }
    while !isSorted(array) {
        sortArray(&array)
    }
}
