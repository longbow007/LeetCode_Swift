//
//  LongestSubstringWithoutRepeatingCharacters.swift
//  Algorithm-Swift
//
//  Created by Xiaojian Duan on 2022/10/28.
//

import Foundation

class LongestSubstringWithoutRepeatingCharactersSolution {
    // func lengthOfLongestSubstring(_ s: String) -> Int {
    //     guard s.count > 1 else {
    //         return s.count
    //     }
    //     let chs = Array<Character>(s)
    //     var map = Array(repeating: -1, count: 128)
    //     var start = 0, result = 0
    //     for (i, c) in chs.enumerated() {
    //         let asc = Int(c.asciiValue ?? 0)
    //         let idx = map[asc]
    //         start = max(start, idx + 1)
    //         result = max(result, i - start + 1)
    //         map[asc] = i
    //     }
    //     return result
    // }
    func lengthOfLongestSubstring(_ s: String) -> Int {
        if s.count <= 1 {
            return s.count;
        }
        let chs = Array<Character>(s)
        var set = Set<Character>()
        var maxLen = 1
        set.insert(chs[0])
        var l = 0
        for i in 1..<chs.count {
            let c = chs[i]
            if !set.contains(c) {
                set.insert(c)
                let len = i - l + 1
                maxLen = max(maxLen, len)
                continue
            }
            while chs[l] != chs[i] {
                set.remove(chs[l])
                l += 1
            }
            // while 循环完成后，l 所在位置是当前 i 指向字母在前面的最后一个相同字母。所以后面要继续 +1 指向不同字母才行
            l += 1
        }
        return maxLen
    }
}
