//
//  ViewBuilder.swift
//  MemorizeDII
//
//  Created by Peerawat Poombua on 7/10/25.
//

import SwiftUI

struct ContentViewForViewBuilder: View {

    @State var color = Color.red
    @State var shape = Shape.roundedRectangle

    enum Shape {
        case roundedRectangle
        case circle
    }

    var body: some View {
        VStack {
            shapeView()
            shapeContainer
            VStack {
                Button("Rounded Rectangle") {
                    self.shape = .roundedRectangle
                    self.color = .red
                }
                Button("Circle") {
                    self.shape = .circle
                    self.color = .green
                }
            }
        }
        .font(.largeTitle   )

    }

    var shapeContainer: some View {
        if shape == .circle {
            AnyView(Circle()
                .fill(color)
                .frame(width: 100, height: 100))
        } else {
            AnyView(RoundedRectangle(cornerRadius: 8)
                .fill(color)
                .frame(width: 100, height: 100))
        }
    }

    @ViewBuilder
    func shapeView() -> some View {
        if shape == .circle {
            Circle()
                .fill(color)
                .frame(width: 100, height: 100)
        } else {
            RoundedRectangle(cornerRadius: 8)
                .fill(color)
                .frame(width: 100, height: 100)
        }
    }
}

#Preview {
    ContentViewForViewBuilder()
}
