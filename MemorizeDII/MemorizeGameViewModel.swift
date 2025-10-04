//
//  MemorizeGameViewModel.swift
//  MemorizeDII
//
//  Created by Peerawat Poombua on 4/10/25.
//

import Foundation

class MemorizeGameViewModel: ObservableObject {

    typealias Card = MemorizeGame.Card

    @Published private var game = MemorizeGame()

    var cards: [Card] {
        game.cards
    }

    // MARK: - Intent

    func pickCard(card: Card) {
        game.pickCard(card: card)
    }
}
