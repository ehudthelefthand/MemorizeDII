//
//  CounterView.swift
//  MemorizeDII
//
//  Created by Peerawat Poombua on 1/10/25.
//

import SwiftUI

struct CounterView: View {

    @State var count: Int = 0

    var body: some View {
        HStack {
            Button(action: {
                count -= 1;
            }, label: {
                Text("－")
            })
            Text("\(count)")
            Button(action: {
                count += 1;
            }, label: {
                Text("＋")
            })
        }
        .font(.largeTitle)
    }
}

#Preview {
    CounterView()
}
