//
//  RussianDollEnvelopes.swift
//  Algorithm-Swift
//
//  Created by Xiaojian Duan on 2022/8/25.
//

import Foundation

class RussianDollEnvelopesSolution {
    func maxEnvelopes(_ envelopes: [[Int]]) -> Int {
        if envelopes.count == 0 {
            return 0
        }
        let arr = envelopes.sorted(by: {$0[0] < $1[0] || ($0[0] == $1[0] && $0[1] < $1[1])})
        let n = arr.count
        var dp = Array(repeating: 0, count: n)
        dp[0] = 1
        var maxDp = 1
        for i in 1..<n {
            dp[i] = 1
            let vi = arr[i]
            for j in 0..<i {
                let vj = arr[j]
                if vj[0] < vi[0] && vj[1] < vi[1] {
                    dp[i] = max(dp[i], dp[j] + 1)
                }
            }
            maxDp = max(maxDp, dp[i])
        }
        return maxDp
    }
}
