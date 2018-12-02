//
//  Concentration.swift
//  Concentration
//
//  Created by Ricky on 7/2/18.
//  Copyright © 2018 Full Stack Design. All rights reserved.
//

import Foundation

struct Concentration {
    private(set) var cards = [Card]()
    private var chosenCards = [Int]()
    private(set) var flipCount = 0
    private(set) var gameScore = 0
    private var indexOfOneAndOnlyFaceUpCard: Int? {
        get {
            var foundIndex: Int?
            for index in cards.indices {
                if cards[index].isFaceUp {
                    if foundIndex == nil {
                        foundIndex = index
                    } else {
                        return nil
                    }
                }
            }
            return foundIndex
        }

        set {
            for index in cards.indices {
                cards[index].isFaceUp = (index == newValue)
            }
        }
    }

    init(numberOfPairsOfCards: Int) {
        assert(numberOfPairsOfCards > 0, "Concentration.init(\(numberOfPairsOfCards)): you must have at least one pair of cards.")
        for _ in 1...numberOfPairsOfCards {
            let card = Card()
            cards += [card, card]
        }
        cards = cards.shuffled()
    }

    mutating func chooseCard(at index: Int) {
        assert(cards.indices.contains(index), "Concentration.chooseCards(at \(index): choosen index not in cards.)")
        if !cards[index].isMatched {
            flipCount += cards[index].isFaceUp ? 0 : 1
            if let matchIndex = indexOfOneAndOnlyFaceUpCard, matchIndex != index {
                if cards[matchIndex].identifier == cards[index].identifier {
                    cards[matchIndex].isMatched = true
                    cards[index].isMatched = true
                    gameScore += 10
                } else {
                    containsChosenCard(indexes: index, matchIndex)
                }
                gameScore += Timer.endTimer() <= 3 ? 2 : 0
                cards[index].isFaceUp = true
            } else {
                Timer.startTimer()
                indexOfOneAndOnlyFaceUpCard = index
            }
        }
    }

    private mutating func containsChosenCard(indexes: Int...) {
        for index in indexes {
            if !chosenCards.contains(index) {
                chosenCards.append(index)
            } else {
                gameScore -= 5
            }
        }
    }

    mutating func newGame(numberOfPairsOfCards: Int) {
        self = Concentration(numberOfPairsOfCards: numberOfPairsOfCards)
    }
}
