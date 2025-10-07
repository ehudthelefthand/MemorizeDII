//
//  MemorizeGameViewModel.swift
//  MemorizeDII
//
//  Created by Peerawat Poombua on 4/10/25.
//

import Foundation

//let cards0: [MemorizeGame.Card] = [
//    MemorizeGame.Card(id: 1, content: "😀"),
//    MemorizeGame.Card(id: 2, content: "😀"),
//    MemorizeGame.Card(id: 3, content: "😆"),
//    MemorizeGame.Card(id: 4, content: "😆"),
//]

class EmojiMemorizeGameViewModel: ObservableObject {

    typealias Card = MemorizeGame<String>.Card

    @Published private var game = createGame()

    // adapable in the future
    private static let emojis = [
        "🚗", "🚕", "🚙", "🚌", "🚎",
        "🏎", "🚓", "🚑", "🚒", "🚐",
        "🛻", "🚚", "🚛", "🚜", "🦽",
        "🛴", "🦼", "🚲", "🛵", "🏍",
        "🛺", "🚃", "🚋", "🚂", "✈️",
        "🚀", "🛸", "🚢", "🚁", "🛶"
    ]

    private static func createGame() -> MemorizeGame<String> {
        MemorizeGame(numberOfPairs: 8) { pairIndex in
            emojis[pairIndex]
        }
    }

    var cards: [Card] {
        game.cards
    }

    // MARK: - Intent

    func pickCard(card: Card) {
        game.pickCard(card: card)
    }
}

