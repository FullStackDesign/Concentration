//
//  Emoji.swift
//  Concentration
//
//  Created by Ricky on 7/3/18.
//  Copyright © 2018 Full Stack Design. All rights reserved.
//

import UIKit

struct Emoji {
    var emojiChoices = ["😀","😇","😍","😎","🤓","😡","😨","🤯","🤢","😈","😰","🤠","🤡","🤬"]
    var emoji = [Int : String]()

    mutating func emoji(for cardIdentifier: Int) -> String {
        if emoji[cardIdentifier] == nil, emojiChoices.count > 0 {
            emoji[cardIdentifier] = emojiChoices.remove(at: Int(arc4random_uniform(UInt32(emojiChoices.count))))
        }
        return emoji[cardIdentifier] ?? "?"
    }
}
