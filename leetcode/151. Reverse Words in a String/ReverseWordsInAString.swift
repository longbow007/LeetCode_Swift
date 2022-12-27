//
//  ReverseWordsInAString.swift
//  Algorithm-Swift
//
//  Created by Xiaojian Duan on 2022/12/27.
//

import Foundation

class ReverseWordsInAStringSolution {
    func reversePartOfArray(_ arr: inout [String.Element], _ start: Int, _ end: Int) {
        var l = start, r = end
        while l < r {
            let temp = arr[l]
            arr[l] = arr[r]
            arr[r] = temp
            l += 1
            r -= 1
        }
    }
    func reverseWords(_ s: String) -> String {
        var arr = Array(s)
        arr.reverse()
        let n = arr.count
        var idx = 0
        var i = 0
        while i < n {
            if arr[i] != " " {
                if idx != 0 {
                    arr[idx] = " "
                    idx += 1
                }
                var j = i
                while j < n && arr[j] != " " {
                    arr[idx] = arr[j]
                    idx += 1
                    j += 1
                }
                // print("idx: \(idx) i: \(i) j: \(j)")
                // print("\(arr[idx - (j - i)...idx-1])")
                reversePartOfArray(&arr, idx - (j - i), idx - 1)
                i = j
            } else {
                i += 1
            }
        }
        return String(arr[0...idx-1])
    }
}
