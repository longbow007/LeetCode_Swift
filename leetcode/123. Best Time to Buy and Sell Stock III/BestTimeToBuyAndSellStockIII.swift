//
//  BestTimeToBuyAndSellStockIII.swift
//  Algorithm-Swift
//
//  Created by Xiaojian Duan on 2022/12/26.
//

import Foundation

class Solution {
    // func maxProfit(_ prices: [Int]) -> Int {
    //     let n = prices.count
    //     if n < 2 {
    //         return 0
    //     }
    //     // 每一天结束时可能的状态：什么也不干，买过一次，卖过一次，买过2次，卖过2次
    //     var buy1 = -prices[0] // 买过一次
    //     var sell1 = 0  // 卖过一次
    //     var buy2 = -prices[0] // 买过2次。初始相当于 buy1 + sell1 - prices[0]
    //     var sell2 = 0  // 卖过2次
    //     for i in 1..<n {
    //         let p = prices[i]
    //         buy1 = max(-p, buy1)
    //         sell1 = max(buy1 + p, sell1)
    //         buy2 = max(sell1 - p, buy2)
    //         sell2 = max(buy2 + p, sell2)
    //     }
    //     return sell2
    // }

    func maxProfit(_ prices: [Int]) -> Int {
        let n = prices.count
        if n < 2 {
            return 0
        }
        let k = 2
        var buy = Array(repeating: -prices[0], count: k)
        var sell = Array(repeating: 0, count: k)
        for i in 1..<n {
            let p = prices[i]
            buy[0] = max(buy[0], -p)
            sell[0] = max(sell[0], buy[0] + p)
            for j in 1..<k {
                buy[j] = max(buy[j], sell[j-1] - p)
                sell[j] = max(sell[j], buy[j] + p)
            }
        }
        return sell[k-1]
    }
}
