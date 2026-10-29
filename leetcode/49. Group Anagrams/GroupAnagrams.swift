//
//  GroupAnagrams.swift
//  MyTool
//
//  Created by DuanXiaojian on 2026/10/14.
//

import Foundation

class GroupAnagramsSolution {
    func groupAnagrams(_ strs: [String]) -> [[String]] {
        var dict: [[Int]: [String]] = [:]
        for str in strs {
            var nums = [Int](repeating: 0, count: 26)
            for char in str {
                let index = char.asciiValue! - Character("a").asciiValue!
                nums[Int(index)] += 1
            }
            dict[nums, default: []].append(str)
        }
        return Array(dict.values)
    }
}
