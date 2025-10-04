//
//  MemorizeDIITests.swift
//  MemorizeDIITests
//
//  Created by Peerawat Poombua on 1/10/25.
//

import Testing
@testable import MemorizeDII

struct MemorizeDIITests {

    @Test func flipCard() throws {
        var game = MemorizeGame()

        let before = try #require(game.cards.first(where: { $0.id == 1 }))
        #expect(before.isFaceUp == false)

        game.pickCard(card: MemorizeGame.Card(id: 1, content: "😀"))

        let after = try #require(game.cards.first(where: { $0.id == 1 }))
        #expect(after.isFaceUp == true)
    }

    @Test func matchCard() throws {
        var game = MemorizeGame()
        
        let before = try #require(game.cards.first(where: { $0.id == 1 }))
        #expect(before.isFaceUp == false)

        game.pickCard(card: MemorizeGame.Card(id: 1, content: "😀"))

        let after = try #require(game.cards.first(where: { $0.id == 1 }))
        #expect(after.isFaceUp == true)
    }

}
