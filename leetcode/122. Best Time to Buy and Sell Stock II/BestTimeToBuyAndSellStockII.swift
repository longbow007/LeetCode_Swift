//
//  BestTimeToBuyAndSellStockII.swift
//  Algorithm-Swift
//
//  Created by Xiaojian Duan on 2022/12/26.
//

import Foundation

class BestTimeToBuyAndSellStockIISolution {
    struct State {
        var buyOrHold: Int
        var sell: Int
    }
    /*
    // 动态规划
    func maxProfit(_ prices: [Int]) -> Int {
        let n = prices.count
        if n <= 1 {
            return 0
        }
        var dp = Array(repeating: State(buyOrHold: 0, sell: 0), count: n)
        dp[0].buyOrHold = -prices[0]
        dp[0].sell = 0
        for i in 1..<n {
            dp[i].buyOrHold = max(dp[i-1].sell - prices[i], dp[i-1].buyOrHold)
            dp[i].sell = max(dp[i-1].buyOrHold + prices[i], dp[i-1].sell)
        }
        return dp[n-1].sell
    }
    */

    // 空间优化版本
    func maxProfit(_ prices: [Int]) -> Int {
        let n = prices.count
        if n <= 1 {
            return 0
        }
        var hold = -prices[0]
        var sell = 0
        for i in 1..<n {
            let p = prices[i]
            let oldSell = sell, oldHold = hold
            hold = max(sell - p, hold)
            sell = max(hold + p, sell)
        }
        return sell
    }
}
