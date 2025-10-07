//
//  Animation.swift
//  MemorizeDII
//
//  Created by Peerawat Poombua on 5/10/25.
//

import SwiftUI

struct Animation: View {
    @State var position = CGPoint.zero
    @State var isScale = false
    @State var circleColor = Color.black

    var body: some View {
        VStack {
            Circle()
                .fill(circleColor)
                .frame(width: 50, height: 50)
                .scaleEffect(isScale ? 2 : 1)
                .animation(
                    .spring(response: 0.3, dampingFraction: 0.3),
                    value: isScale
                )
                .offset(x: position.x - 25, y: position.y - 25)
                .gesture(
                    DragGesture(minimumDistance: 0).onChanged { value in
                        withAnimation(.spring(response: 0.3, dampingFraction: 0.3)) {
                            self.position = value.location
                        }
                    }
                )
            Spacer()
            Toggle("Scale", isOn: self.$isScale)
            Button("Cycle Color") {
                withAnimation(.default) {
                    [Color.red, .orange, .yellow, .blue, .indigo]
                        .enumerated()
                        .forEach { index, color in
                            DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(index)) {
                                self.circleColor = color
                            }
                        }
                }
            }
        }
        .padding(.all, 24)
    }
}

#Preview {
    Animation()
}
