//
//  RepeatedDNASequences.swift
//  Algorithm-Swift
//
//  Created by Xiaojian Duan on 2022/12/28.
//

import Foundation

class RepeatedDNASequencesSolution {
    func findRepeatedDnaSequences(_ s: String) -> [String] {
        let len = 10
        let n = s.count
        var res: [String] = []
        if n < len {
            return res
        }
        let arr = Array(s)
        let map: [String.Element: Int] = ["A": 0, "C": 1, "G": 2, "T": 3]
        let mask = 0xfffff
        var x = map[arr[0]] ?? 0
        for i in 1..<len {
            let key = map[arr[i]] ?? 0
            x = (x << 2) | key
        }
        var cntMap: [Int: Int] = [:]
        cntMap[x] = 1
        for j in len..<n {
            let key = map[arr[j]] ?? 0
            x = ((x << 2) | key) & mask
            if let cnt = cntMap[x] {
                cntMap[x] = cnt + 1
            } else {
                cntMap[x] = 1
            }
            if cntMap[x] == 2 {
                let sub = String(arr[(j - len + 1)...j])
                res.append(sub)
            }
        }
        return res
    }
}
