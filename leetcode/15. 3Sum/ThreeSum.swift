//
//  ThreeSum.swift
//  Algorithm-Swift
//
//  Created by Xiaojian Duan on 2022/10/28.
//

import Foundation

class ThreeSumSolution {
    func threeSum(_ nums: [Int]) -> [[Int]] {
        let n = nums.count
        var res = [[Int]]()
        if n < 3 {
            return res
        }
        let arr = nums.sorted()
        for i in 0..<n {
            if arr[i] > 0 {
                break
            }
            if i > 0 && arr[i] == arr[i-1] {
                continue
            }
            var j = i + 1, k = n - 1
            while j < k {
                let sum = arr[i] + arr[j] + arr[k]
                if sum == 0 {
                    res.append([arr[i], arr[j], arr[k]])
                    repeat {
                        j += 1
                    } while j < k && arr[j] == arr[j-1]
                    repeat {
                        k -= 1
                    } while j < k && arr[k] == arr[k+1]
                } else if sum > 0 {
                    k -= 1
                } else {
                    j += 1
                }
            }
        }
        return res
    }
}
