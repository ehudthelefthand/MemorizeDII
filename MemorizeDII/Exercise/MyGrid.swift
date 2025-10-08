//
//  MyGrid.swift
//  MemorizeDII
//
//  Created by Peerawat Poombua on 7/10/25.
//

import SwiftUI

struct MyGrid: View {

    @State var alignment = MyAlignment.R

    var body: some View {
        VStack {
            Spacer()
            grid
            Spacer()
            buttons
        }
        .padding(.all, 24)
    }

    enum MyAlignment {
        case H
        case R
        case V
    }

//    enum StockType {
//        case inStock(amount: Int)
//        case outOfStock(isBackOrder: Bool)
//    }
//
//    var stockType = StockType.inStock(amount: 10)
//
//    var stocking: some View {
//        switch stockType {
//            case let .inStock(amount):
//            Text("In Stock: \(amount)")
//        case let .outOfStock(isBackOrder):
//            Text(isBackOrder ? "Back Order" : "Out of Stock")
//        }
//    }

    @ViewBuilder
    var grid: some View {
        switch alignment {
        case .H:
            horizontal
        case .V:
            vertical
        case .R:
            reset
        }
    }


    var buttons: some View {
        HStack {
//            Button("H") {
//                alignment = .H
//            }
//            .buttonStyle(.borderedProminent)
//            .font(Font.largeTitle.bold())
//            .tint(.mint)
//
//            Button("R") {
//                alignment = .R
//            }
//            .buttonStyle(.borderedProminent)
//            .font(Font.largeTitle.bold())
//            .tint(.mint)
//
//            Button("V") {
//                alignment = .V
//            }
//            .buttonStyle(.borderedProminent)
//            .font(Font.largeTitle.bold())
//            .tint(.mint)

            makeButton(title: "H") {
                alignment = .V
            }

            makeButton(title: "R") {
                alignment = .V
            }

            makeButton(title: "V") {
                alignment = .V
            }
        }

    }

    func main() {
        doSomething1(alignment: .V)
//        doSomething2(alignment: "vertcal")
    }

    func doSomething1(alignment: MyAlignment) {

    }

    func doSomething2(alignment: String) {
        if alignment == "vertical" {

        }
    }

    func makeButton(
        title: String,
        action: @escaping () -> Void
    ) -> some View {
        Button(title) {
            action()
        }
        .buttonStyle(.borderedProminent)
        .font(Font.largeTitle.bold())
        .tint(.mint)
    }

    var reset: some View {
        VStack {
            HStack {
                block
                block
            }
            HStack {
                block
                block
            }
        }
    }

    var horizontal: some View {
        HStack {
            block
            block
            block
            block
        }
    }

    var vertical: some View {
        VStack {
            block
            block
            block
            block
        }
    }

    var block: some View {
        RoundedRectangle(cornerRadius: 12)
            .fill(Color.blue)
            .frame(width: 100, height: 100)
    }

}

#Preview {
    MyGrid()
}
