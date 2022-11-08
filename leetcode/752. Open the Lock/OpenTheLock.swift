//
//  OpenTheLock.swift
//  Algorithm-Swift
//
//  Created by Xiaojian Duan on 2022/11/8.
//

import Foundation

class OpenTheLockSolution {
    func plusOne(_ s: String, _ i: Int) -> String {
        var chs = Array(s)
        var c = chs[i]
        if c == "9" {
            c = "0"
        } else {
            c = Character(UnicodeScalar(c.asciiValue! + 1))
        }
        chs[i] = c
        return String(chs)
    }
    func minusOne(_ s: String, _ i: Int) -> String {
        var chs = Array(s)
        var c = chs[i]
        if c == "0" {
            c = "9"
        } else {
            c = Character(UnicodeScalar(c.asciiValue! - 1))
        }
        chs[i] = c
        return String(chs)
    }
    func openLock(_ deadends: [String], _ target: String) -> Int {
        var q: [String] = []
        var used = Set<String>()
        var dead = Set(deadends)
        q.append("0000")
        used.insert("0000")
        var steps = 0
        while !q.isEmpty {
            let size = q.count
            for _ in 0..<size {
                let lock = q.first!
                q.removeFirst()
                if dead.contains(lock) {
                    continue
                }
                if lock == target {
                    return steps
                }
                for j in 0..<4 {
                    let plus = plusOne(lock, j)
                    if !used.contains(plus) {
                        q.append(plus)
                        used.insert(plus)
                    }
                    let minus = minusOne(lock, j)
                    if !used.contains(minus) {
                        q.append(minus)
                        used.insert(minus)
                    }
                }
            }
            steps += 1
        }
        return -1
    }
}
