//
//  EmojiMemorizeGameView.swift
//  MemorizeDII
//
//  Created by Peerawat Poombua on 1/10/25.
//

import SwiftUI

struct EmojiMemorizeGameView: View {

    @ObservedObject var viewModel = EmojiMemorizeGameViewModel()

    var body: some View {
        VStack {
            gameBody
            deckBody
        }
    }

    @State private var dealt = Set<Int>()
    @Namespace private var dealingCardNamespace

    private func deal(_ card: EmojiMemorizeGameViewModel.Card) {
        dealt.insert(card.id)
    }

    var gameBody: some View {
        AspectVGrid(
            cards: viewModel.cards,
            aspectRatio: 2/3
        ) { card in
            if dealt.contains(card.id) {
                CardView(card: card)
                    .transition(.asymmetric(insertion: .identity, removal: .opacity))
                    .matchedGeometryEffect(id: card.id, in: dealingCardNamespace)
                    .zIndex(zIndex(of: card))
                    .onTapGesture {
                        viewModel.pickCard(card: card)
                    }
            }
        }
        .padding(.all, 8)
    }

    var deckBody: some View {
        VStack {
            ZStack {
                ForEach(viewModel.cards) { card in
                    if !dealt.contains(card.id) {
                        CardView(card: card)
                            .matchedGeometryEffect(id: card.id, in: dealingCardNamespace)
                            .transition(.asymmetric(insertion: .opacity, removal: .identity))
                            .zIndex(zIndex(of: card))
                    }
                }
            }
            .frame(
                width: 100,
                height: 150,
            )
            .onTapGesture {
                for card in viewModel.cards {
                    withAnimation(dealingAnimation(card)) {
                        deal(card)
                    }
                }
            }
            HStack {
                Button("Shuffle") {
                    withAnimation(.default) {
                        viewModel.shuffle()
                    }
                }
                Spacer()
                Button("Reset") {
                    withAnimation {
                        dealt = Set<Int>()
                    }
                }
            }
            .padding()
            .font(.largeTitle)
        }
    }


    private func zIndex(of card: EmojiMemorizeGameViewModel.Card) -> Double {
        -Double(viewModel.cards.firstIndex(where: { $0.id == card.id }) ?? 0)
    }

    private func dealingAnimation(_ card: EmojiMemorizeGameViewModel.Card) -> Animation {
        let totalDealtingDuration = 2.0
        let ratio = totalDealtingDuration / Double(viewModel.cards.count)
        var delay = 0.0
        if let index = viewModel.cards.firstIndex(where: { $0.id == card.id }) {
            delay = Double(index) * ratio
        }
        return .easeInOut.delay(delay)
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
    EmojiMemorizeGameView()
}
