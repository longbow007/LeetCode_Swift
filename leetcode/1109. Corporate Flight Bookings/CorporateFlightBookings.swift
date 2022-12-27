//
//  CorporateFlightBookings.swift
//  Algorithm-Swift
//
//  Created by Xiaojian Duan on 2022/12/27.
//

import Foundation

class CorporateFlightBookingsSolution {
    func corpFlightBookings(_ bookings: [[Int]], _ n: Int) -> [Int] {
        var temp = Array(repeating: 0, count: n)
        for book in bookings {
            let first = book[0]
            let last = book[1]
            let seats = book[2]
            temp[first-1] += seats
            if last < n {
                temp[last] -= seats
            }
        }
        var res = Array(repeating: 0, count: n)
        var t = 0
        for i in 0..<n {
            res[i] = t + temp[i]
            t = res[i]
        }
        return res
    }
}
