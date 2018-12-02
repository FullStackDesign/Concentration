//
//  Card.swift
//  Concentration
//
//  Created by Ricky on 7/2/18.
//  Copyright © 2018 Full Stack Design. All rights reserved.
//

import Foundation

struct Card {
    var isFaceUp = false
    var isMatched = false
    private(set) var identifier: Int
    private static var identifierFactory = 0

    private static func getUniqueIdentifier() -> Int {
        identifierFactory += 1
        return identifierFactory
    }

    init() {
        self.identifier = Card.getUniqueIdentifier()
    }
}
