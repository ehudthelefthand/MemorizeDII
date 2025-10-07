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

class MemorizeGameViewModel: ObservableObject {

    typealias Card = MemorizeGame.Card

    @Published private var game = MemorizeGame(cards: cards0)

    private static let cards0: [Card] = createCard()

    private static func createCard() -> [Card] {
        let emojis = ["😀", "😆"]

        var temp = [Card]()

        var numberOfPairs = 2

        for pairIndex in 0..<numberOfPairs {
            temp.append(Card(id: pairIndex * 2, content: emojis[pairIndex]))
            temp.append(Card(id: pairIndex * 2 + 1, content: emojis[pairIndex]))
        }

        return temp
    }

    var cards: [Card] {
        game.cards
    }

    // MARK: - Intent

    func pickCard(card: Card) {
        game.pickCard(card: card)
    }
}

