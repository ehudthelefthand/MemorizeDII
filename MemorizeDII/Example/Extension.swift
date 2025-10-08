//
//  Extension.swift
//  MemorizeDII
//
//  Created by Peerawat Poombua on 7/10/25.
//

import Foundation

extension Array where Element == Int {
    var sum: Int {
        let s = 0
        for i in self {
            return s + i
        }
        return s
    }
}

func main3() {
    let a: [Int] = [1, 2, 5]
    print(a.sum)

    let b: [String] = ["1", "2", "5"]
//    print(b.sum) ERR!
}
