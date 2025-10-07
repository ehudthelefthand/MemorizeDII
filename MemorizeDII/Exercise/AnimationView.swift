//
//  Animation.swift
//  MemorizeDII
//
//  Created by Peerawat Poombua on 5/10/25.
//

import SwiftUI


// Animation = Animate things that have changed in the view
// Things that caused animation
// - In/Out view hierachy -> Transition
// - State changed (Intent)

struct Animation: View {

    @State var position = CGPoint.zero
    @State var isCircleScaled = false
    @State var circleColor = Color.black

    var body: some View {
        VStack {
            Circle()
                .fill(circleColor)
                .frame(width: 50, height: 50)
                .scaleEffect(isCircleScaled ? 2.5 : 1)
                .animation(
                    .spring(response: 0.3, dampingFraction: 0.3),
                    value: isCircleScaled
                )
                .offset(x: position.x - 25, y: position.y - 25)
                .gesture(
                    DragGesture(minimumDistance: 0).onChanged { value in
                        withAnimation(.spring(response: 0.3, dampingFraction: 0.1)) {
                            self.position = value.location
                        }
                    }
                )

//            Toggle("Scale", isOn: Binding(
//                get: { return isCircleScaled },
//                set: { newValue in
//                    self.isCircleScaled = newValue
//                }))

            Spacer()
            Toggle("Scale", isOn: self.$isCircleScaled)
//            Button("Scale") {
//                self.isCircleScaled.toggle()
//            }
            Button("Cycle Color") {
                [Color.red, .blue, .yellow, .green]
                    .enumerated()
                    .forEach { index, color in
                        DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(index)) {
                                withAnimation(.default) {
                                    self.circleColor = color
                                }
                            }
                    }
            }

            Button("Reset") {
                self.position = CGPoint.zero
                self.isCircleScaled = false
                self.circleColor = Color.black
            }
         }
        .padding(.all, 24)
        .font(.largeTitle)
    }
}

#Preview {
    Animation()
}
