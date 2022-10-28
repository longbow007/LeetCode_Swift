//
//  MergeSortedArray.swift
//  Algorithm-Swift
//
//  Created by Xiaojian Duan on 2022/8/28.
//

import Foundation

class MergeSortedArraySolution {
    func merge(_ nums1: inout [Int], _ m: Int, _ nums2: [Int], _ n: Int) {
        var i = m - 1, j = n - 1, k = m + n - 1
        while (j >= 0) {
            while (i >= 0 && nums1[i] > nums2[j]) {
                let a = nums1[i]
                nums1[i] = nums1[k]
                nums1[k] = a
                i -= 1
                k -= 1
            }
            nums1[k] = nums2[j]
            k -= 1
            j -= 1
        }
    }
}
