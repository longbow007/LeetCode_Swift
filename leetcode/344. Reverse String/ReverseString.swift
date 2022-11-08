//
//  ReverseString.swift
//  Algorithm-Swift
//
//  Created by Xiaojian Duan on 2022/11/5.
//

import Foundation

class ReverseStringSolution {
    func reverseString(_ s: inout [Character]) {
        var l = 0, r = s.count - 1
        while l < r {
            let temp = s[l]
            s[l] = s[r]
            s[r] = temp
            l += 1
            r -= 1
        }
    }
}
