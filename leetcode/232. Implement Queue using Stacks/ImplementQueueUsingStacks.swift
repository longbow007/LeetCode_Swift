//
//  ImplementQueueUsingStacks.swift
//  AlgorithmSwift
//
//  Created by DuanXiaojian on 2025/3/23.
//

import Foundation

class MyQueue {
    private var s1: [Int]
    private var s2: [Int]
    init() {
        s1 = []
        s2 = []
    }
    
    func push(_ x: Int) {
        while !s2.isEmpty {
            s1.append(s2.last!)
            s2.removeLast()
        }
        s1.append(x)
    }
    
    func pop() -> Int {
        let res = peek()
        s2.removeLast()
        return res
    }
    
    func peek() -> Int {
        while !s1.isEmpty {
            s2.append(s1.last!)
            s1.removeLast()
        }
        return s2.last!
    }
    
    func empty() -> Bool {
        return s1.isEmpty && s2.isEmpty
    }
}
