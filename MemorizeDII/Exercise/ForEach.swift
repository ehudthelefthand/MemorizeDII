//
//  ForEach.swift
//  MemorizeDII
//
//  Created by Peerawat Poombua on 7/10/25.
//

import SwiftUI

struct Item: Identifiable {
    let id: Int
    let val: String
}

struct ContentView: View {

    let items1 = [(id: 1, val: "One"), (id: 2, val: "Two"), (id: 3, val: "Three"), (id: 4, val: "One")]
    let items2 = [(1, "One"), (2, "Two"), (3, "Three"), (4, "One")]
    let items3 = [Item(id: 1, val: "One"), Item(id: 2, val: "Two"), Item(id: 3, val: "Three"), Item(id: 4, val: "One")]


    var body: some View {
        ForEach(items1, id: \.id) { item in
            Text(item.val)
        }

        ForEach(items2, id: \.0) { item in
            Text(item.1)
        }

        ForEach(items3) { item in
            Text(item.val)
        }
    }
}
