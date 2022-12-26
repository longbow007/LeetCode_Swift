//
//  BestTimeToBuyAndSellStockIV.swift
//  Algorithm-Swift
//
//  Created by Xiaojian Duan on 2022/12/26.
//

import Foundation

class BestTimeToBuyAndSellStockIVSolution {
    func maxProfit(_ k: Int, _ prices: [Int]) -> Int {
        let n = prices.count
        if n < 2 || k < 1 {
            return 0
        }
        let m = min(k, n/2)
        // buy[j] 的含义：买过 j 次以后手头现金的最大值
        // sell[j] 含义同上
        var buy: [Int] = Array(repeating: -prices[0], count: m)
        var sell: [Int] = Array(repeating: 0, count: m)
        for i in 1..<n {
            let p = prices[i]
            // 第 i 天，买过 1 次的情况下，手头现金最大值，所以要和当前价格对比。实际上就是取第 i 天价格最小值的负数
            buy[0] = max(buy[0], -p)
            sell[0] = max(sell[0], buy[0] + p)
            for j in 1..<m {
                buy[j] = max(buy[j], sell[j-1] - p)
                sell[j] = max(sell[j], buy[j] + p)
            }
        }
        return sell[m-1]
    }
}
