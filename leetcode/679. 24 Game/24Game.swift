//
//  24Game.swift
//  Algorithm-Swift
//
//  Created by Xiaojian Duan on 2023/1/9.
//

import Foundation

class TwentyFourGameSolution {
    let epsilon = 1e-6
    func dfs(_ cards: [Double]) -> Bool {
        let n = cards.count
        if n == 0 {
            return false
        }
        if n == 1 {
            return fabs(cards[0] - 24) < epsilon
        }
        for i in 0..<n {
            for j in 0..<n {
                if i == j {
                    continue
                }
                var newCards = [Double]()
                for k in 0..<n {
                    if k != i && k != j {
                        newCards.append(cards[k])
                    }
                }
                // 0 - add; 1 - multiply; 2 - subtrack; 3 - divide;
                for op in 0..<4 {
                    if op < 2 && i > j {
                        continue
                    }
                    let a = cards[i], b = cards[j]
                    if op == 0 {
                        newCards.append(a + b)
                    } else if op == 1 {
                        newCards.append(a * b)
                    } else if op == 2 {
                        newCards.append(a - b)
                    } else {
                        if b < epsilon {
                            continue
                        }
                        newCards.append(a / b)
                    }
                    if (dfs(newCards)) {
                        return true
                    }
                    newCards.removeLast()
                }
            }
        }
        return false
    }
    func judgePoint24(_ cards: [Int]) -> Bool {
        var arr: [Double] = []
        for x in cards {
            arr.append(Double(x))
        }
        return dfs(arr)
    }
}
