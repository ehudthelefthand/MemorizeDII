//
//  BackgroundView.swift
//  MemorizeDII
//
//  Created by Peerawat Poombua on 1/10/25.
//

import SwiftUI

struct BackgroundView: View {

    @State var color: Color = .red

    var body: some View {
        ZStack {
            Rectangle()
                .fill(color)
            VStack {
                Button(action: {}, label: {})

                Button("Red") {
                    color = .red
                }
                Button("Blue") {
                    color = .blue
                }
                Button("Green") {
                    color = .green
                }
            }
            .font(Font.largeTitle.bold())
            .foregroundStyle(.white)
        }

    }
}

#Preview {
    BackgroundView()
}
