//
//  StringExtension.swift
//  Algorithm-Swift
//
//  Created by Xiaojian Duan on 2022/10/29.
//

import Foundation

extension String {
    subscript(i: Int) -> String {
        return i < self.count ? String(self[self.index(self.startIndex, offsetBy: i)]) : ""
    }
}
