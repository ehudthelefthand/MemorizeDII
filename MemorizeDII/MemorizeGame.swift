//
//  MemorizeGame.swift
//  MemorizeDII
//
//  Created by Peerawat Poombua on 4/10/25.
//

import Foundation

struct MemorizeGame<CardContent> where CardContent: Equatable {

    private(set) var cards: [Card] = []

    init(numberOfPairs: Int, createContent: (Int) -> CardContent) {
        for pairIndex in 0..<numberOfPairs {
            let content = createContent(pairIndex)
            cards.append(
                Card(
                    id: pairIndex * 2,
                    content: content
                )
            )
            cards.append(
                Card(
                    id: pairIndex * 2 + 1,
                    content: content
                )
            )
        }
    }

    private var indexOfOneAndOnlyOneFaceUpCard: Int? {
        get { cards.indices.filter { cards[$0].isFaceUp }.oneAndOnly }
        set { cards.indices.forEach { cards[$0].isFaceUp = ($0 == newValue) } }
    }

    mutating func pickCard(card: Card)  {
        if let index = cards.firstIndex(where: { $0.id == card.id }),
           !cards[index].isFaceUp,
           !cards[index].isMatched {

            if let indexOfPotentiallyMatchCard = indexOfOneAndOnlyOneFaceUpCard {
                if cards[indexOfPotentiallyMatchCard].content == cards[index].content {
                    cards[indexOfPotentiallyMatchCard].isMatched = true
                    cards[index].isMatched = true
                }
            } else {
                indexOfOneAndOnlyOneFaceUpCard = index
            }

            cards[index].isFaceUp = true
        }

        print("============")
        print(cards)
    }

    struct Card: Identifiable {
        let id: Int
        let content: CardContent
        var isFaceUp: Bool = false
        var isMatched: Bool = false
    }
}

extension Array {
    var oneAndOnly: Element? {
        if count == 1 {
            return first
        } else {
            return nil
        }
    }
}
