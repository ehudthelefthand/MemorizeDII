//
//  SwiftUIView.swift
//  MemorizeDII
//
//  Created by Peerawat Poombua on 8/10/25.
//

import SwiftUI

struct BasicTransitionView: View {
    @State private var show = false

    var body: some View {
        VStack {
            Spacer()

            if show {
                Text("Hello SwiftUI!")
                    .padding()
                    .background(.mint, in: RoundedRectangle(cornerRadius: 12))
                    .transition(.scale)
            }

            Spacer()

            Button(show ? "hide" : "show") {
                withAnimation {
                    show.toggle()
                }
            }
        }
        .font(.largeTitle)
        .padding()
    }
}

#Preview {
    BasicTransitionView()
}
