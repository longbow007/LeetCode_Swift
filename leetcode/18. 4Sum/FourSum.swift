//
//  FourSum.swift
//  Algorithm-Swift
//
//  Created by Xiaojian Duan on 2022/10/30.
//

import Foundation

class FourSumSolution {
    func fourSum(_ nums: [Int], _ target: Int) -> [[Int]] {
        let n = nums.count
        var ans: [[Int]] = []
        if n < 4 {
            return ans
        }
        let arr = nums.sorted()
        for i in 0..<n {
            if i > 0 && arr[i] == arr[i-1] {
                continue
            }
            if arr[i] > 0 && arr[i] > target {
                break;
            }
            for j in i+1..<n {
                if j > i+1 && arr[j] == arr[j-1] {
                    continue
                }
                var l = j + 1, r = n - 1
                while l < r {
                    let sum = arr[i] + arr[j] + arr[l] + arr[r]
                    if sum == target {
                        ans.append([arr[i], arr[j], arr[l], arr[r]])
                        repeat {
                            r -= 1
                        } while l < r && arr[r] == arr[r+1]
                        repeat {
                            l += 1
                        } while l < r && arr[l] == arr[l-1]
                        continue
                    }
                    if sum > target {
                        r -= 1
                    } else {
                        l += 1
                    }
                }
            }
        }
        return ans;
    }
}
