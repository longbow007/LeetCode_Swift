//
//  StockMaxProfit.swift
//  Algorithm-Swift
//
//  Created by Xiaojian Duan on 2022/12/26.
//

import Foundation

class StockMaxProfitSolution {
    func maxProfit(_ prices: [Int]) -> Int {
        let n = prices.count
        if n < 2 {
            return 0
        }
        var price = prices[0]
        var profit = 0
        for i in 1..<n {
            profit = max(profit, prices[i] - price)
            price = min(price, prices[i])
        }
        return profit
    }
}
