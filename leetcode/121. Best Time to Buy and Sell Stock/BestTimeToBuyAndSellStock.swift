//
//  BestTimeToBuyAndSellStock.swift
//  Algorithm-Swift
//
//  Created by Xiaojian Duan on 2022/12/6.
//

import Foundation

class BestTimeToBuyAndSellStockSolution {
    // 动态规划
    // func maxProfit(_ prices: [Int]) -> Int {
    //     let n = prices.count
    //     if n <= 1 {
    //         return 0
    //     }
    //     var minPrice = prices[0]
    //     // do[i] 含义：第 i 个元素对应的最大利润。状态转移方程如下：
    //     // dp[i] = max(dp[i-1], minPrice - prices[i])
    //     // 即：第 i 个元素的最大利润，等于第 i-1 个元素对应的最大利润与当前利润的最大值
    //     var dp = Array(repeating: 0, count: n)
    //     dp[0] = 0
    //     for i in 1..<n {
    //         minPrice = min(minPrice, prices[i])
    //         dp[i] = max(dp[i-1], prices[i] - minPrice)
    //     }
    //     return dp[n-1]
    // }
    
    // 动态规划改进版本
    // dp[i] 无后效性，所以可以用一个局部变量代替
    func maxProfit(_ prices: [Int]) -> Int {
        let n = prices.count
        if n <= 1 {
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
