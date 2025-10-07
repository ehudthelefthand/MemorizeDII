//
//  MemorizeGameView.swift
//  MemorizeDII
//
//  Created by Peerawat Poombua on 1/10/25.
//

import SwiftUI


struct MemorizeGameView: View {

    @ObservedObject var viewModel = EmojiMemorizeGameViewModel()

    var body: some View {
        AspectVGrid(
            cards: viewModel.cards,
            aspectRatio: 2/3
        ) { card in
            CardView(card: card)
                .onTapGesture {
                    viewModel.pickCard(card: card)
                }
        }
        .padding(.all, 8)
    }
}

struct CardView: View {

    let card: EmojiMemorizeGameViewModel.Card

    var body: some View {
        ZStack {
            let shape = RoundedRectangle(cornerRadius: 16)
            if card.isFaceUp {
                shape
                    .fill(Color.white)
                    .strokeBorder(lineWidth: 8)
                Text(card.content)
                    .font(.largeTitle)
            } else if (card.isMatched) {
                shape
                    .fill(Color.clear)
            } else {
                shape
                    .fill(Color.green)
            }
        }
        .padding(.all, 4)
        .foregroundStyle(.green)
    }
}

#Preview {
    MemorizeGameView()
}
