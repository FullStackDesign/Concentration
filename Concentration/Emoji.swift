//
//  Emoji.swift
//  Concentration
//
//  Created by Ricky on 7/3/18.
//  Copyright © 2018 Full Stack Design. All rights reserved.
//

import UIKit

struct Emoji {
    var emojiChoices = [String]()
    var emoji = [Int : String]()

    struct Theme {
        let emojis: [String]
    }

    let emojiThemes = [
        Theme(emojis: ["🐶","🐱","🐭","🐹","🐰","🦊","🐻","🐼","🦄","🦁","🐸","🐵","🐷","🐧"]),
        Theme(emojis: ["😀","😇","😍","😎","🤓","😡","😨","🤯","🤢","😈","😰","🤠","🤡","🤬"]),
        Theme(emojis: ["🐳","🦀","🏖","🏝","🛥","🦑","🌊","🐋","🐙","🐚","🐟","🐠","🐡","🐬"]),
        Theme(emojis: ["👷‍♀️","👷‍♂️","🚧","🏗","⛑","🔨","⛏","📋","🛑","⚠️","📐","⚒","🔦","🏢"]),
        Theme(emojis: ["🦇","🦉","😱","😈","👹","🤡","👻","💀","🎃","🧛‍♀️","🕷","🕸","🧛‍♂️","🧟‍♀️"]),
        Theme(emojis: ["🤶","🎄","🎅","❄️","☃️","🎁","🎀","🛍","🔔","😇","🚶‍♀️","👨‍👩‍👧‍👦","🧣","🧤"]),]

    mutating func chooseNewRandomEmojiTheme() {
        emoji.removeAll()
        emojiChoices.removeAll()
        let emojiTheme = emojiThemes[Int.random(in: 0..<emojiThemes.count)]
        emojiChoices = emojiTheme.emojis
    }

    mutating func emoji(for cardIdentifier: Int) -> String {
        if emoji[cardIdentifier] == nil, emojiChoices.count > 0 {
            emoji[cardIdentifier] = emojiChoices.remove(at: Int.random(in: 0..<emojiThemes.count))
        }
        return emoji[cardIdentifier] ?? "?"
    }
}
