//
//  AspectVGrid.swift
//  MemorizeDII
//
//  Created by Peerawat Poombua on 4/10/25.
//

import SwiftUI

struct AspectVGrid<ItemView>: View where ItemView: View  {
    var cards: [EmojiMemorizeGameViewModel.Card]
    var aspectRatio: CGFloat
    var content: (EmojiMemorizeGameViewModel.Card) -> ItemView

    var body: some View {
        GeometryReader { geometry in
            let width = widthThatFit(
                itemCount: cards.count,
                size: geometry.size,
                itemAspectRatio: aspectRatio
            )
            LazyVGrid(columns: [
                GridItem(.adaptive(minimum: width), spacing: 0)
            ], spacing: 0) {
                ForEach(cards, id: \.id) { card in
                    content(card)
                        .aspectRatio(2/3, contentMode: .fit)
                }
            }
        }
    }

    private func widthThatFit(itemCount: Int, size: CGSize, itemAspectRatio: CGFloat) -> CGFloat {
        var columnCount = 1
        var rowCount = itemCount
        repeat {
            let itemWidth = size.width / CGFloat(columnCount)
            let itemHeight = itemWidth / itemAspectRatio
            if CGFloat(rowCount) * itemHeight < size.height {
                break
            }
            columnCount += 1
            rowCount = (itemCount + (columnCount-1)) / columnCount
        } while columnCount < itemCount
        if columnCount > itemCount {
            columnCount = itemCount
        }
        return floor(size.width / CGFloat(columnCount))
    }
}

#Preview {
    AspectVGrid(cards: [
        EmojiMemorizeGameViewModel.Card(id: 1, content: "😆"),
        EmojiMemorizeGameViewModel.Card(id: 2, content: "😆"),
        EmojiMemorizeGameViewModel.Card(id: 3, content: "😆"),
        EmojiMemorizeGameViewModel.Card(id: 4, content: "😆"),
    ], aspectRatio: 2/3) { card in
        CardView(card: card)
    }
}
