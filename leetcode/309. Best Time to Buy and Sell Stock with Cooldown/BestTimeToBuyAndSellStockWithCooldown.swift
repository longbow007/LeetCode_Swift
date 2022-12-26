//
//  BestTimeToBuyAndSellStockWithCooldown.swift
//  Algorithm-Swift
//
//  Created by Xiaojian Duan on 2022/12/26.
//

import Foundation

class BestTimeToBuyAndSellStockWithCooldownSolution {
    func maxProfit(_ prices: [Int]) -> Int {
        let n = prices.count
        if n < 2 {
            return 0
        }
        var sell = 0, possess = -prices[0], lastSell = 0
        for i in 1..<n {
            let p = prices[i]
            let oldSell = sell, oldPossess = possess
            if i == 1 {
                possess = max(oldPossess, -p)
            } else {
                possess = max(oldPossess, lastSell - p)
                lastSell = sell
            }
            sell = max(oldSell, oldPossess + p)
        }
        return sell
    }
}
