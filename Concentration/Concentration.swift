//
//  Concentration.swift
//  Concentration
//
//  Created by Ricky on 7/2/18.
//  Copyright © 2018 Full Stack Design. All rights reserved.
//

import Foundation
import GameKit

struct Concentration {
    var cards = [Card]()
    var indexOfOneAndOnlyFaceUpCard: Int?

    init(numberOfPairsOfCards: Int) {
        assert(numberOfPairsOfCards > 0, "Concentration.init(\(numberOfPairsOfCards)): you must have at least one pair of cards.")
        for _ in 1...numberOfPairsOfCards {
            let card = Card()
            cards += [card, card]
        }
        cards = GKRandomSource.sharedRandom().arrayByShufflingObjects(in: cards) as! [Card]
    }

    mutating func chooseCard(at index: Int) {
        assert(cards.indices.contains(index), "Concentration.chooseCards(at \(index): choosen index not in cards.)")
        if !cards[index].isMatched {
            if let matchIndex = indexOfOneAndOnlyFaceUpCard, matchIndex != index {
                if cards[matchIndex].identifier == cards[index].identifier {
                    cards[matchIndex].isMatched = true
                    cards[index].isMatched = true
                }
                cards[index].isFaceUp = true
                indexOfOneAndOnlyFaceUpCard = nil
            } else {
                for flipDownIndex in cards.indices {
                    cards[flipDownIndex].isFaceUp = false
                }
                cards[index].isFaceUp = true
                indexOfOneAndOnlyFaceUpCard = index
            }
        }
    }

    mutating func newGame() {
        for index in cards.indices {
            cards[index].isMatched = false
            cards[index].isFaceUp = false
        }
        Card.identifierFactory = 0
        cards = GKRandomSource.sharedRandom().arrayByShufflingObjects(in: cards) as! [Card]
    }
}
