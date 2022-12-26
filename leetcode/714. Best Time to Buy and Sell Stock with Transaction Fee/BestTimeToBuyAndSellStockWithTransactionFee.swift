//
//  BestTimeToBuyAndSellStockWithTransactionFee.swift
//  Algorithm-Swift
//
//  Created by Xiaojian Duan on 2022/12/26.
//

import Foundation

class BestTimeToBuyAndSellStockWithTransactionFeeSolution {
    func maxProfit(_ prices: [Int], _ fee: Int) -> Int {
        let n = prices.count
        if n < 2 {
            return 0
        }
        var sell = 0, possess = -prices[0]
        for i in 1..<n {
            let p = prices[i]
            let oldSell = sell, oldPossess = possess
            sell = max(oldPossess + p - fee, oldSell)
            possess = max(oldSell - p, oldPossess)
        }
        return sell
    }
}
