//
//  File.swift
//  MemorizeDII
//
//  Created by Peerawat Poombua on 8/10/25.
//

import Foundation


enum StockState1 {
    case inStock(amount: Int)
    case outOfStock(isBackOrder: Bool)
}

var state = StockState1.inStock(amount: 10)

struct StockState2 {
    var inStock: Bool
    var isBackOrder: Bool
    var amount: Int
}

// inStock == true and isBackOrder == true
// เกิดขึ้นได้มั้ย และ make sense มั้ย
