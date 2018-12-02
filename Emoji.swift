//
//  Emoji.swift
//  Concentration
//
//  Created by Ricky on 7/3/18.
//  Copyright © 2018 Full Stack Design. All rights reserved.
//

import UIKit

struct ThemeColor {
    let backgroundColor: UIColor
    let textBubbleGradientColors: [UIColor]
    let cardBackgroundColor: UIColor
    let cardBorderColor: UIColor
    let newGameButtonBackgroundColor: UIColor
    let textGUIColor: UIColor
}

struct Emoji {
    private var emojiChoices = [String]()
    private var emoji = [Int : String]()

    private struct Theme {
        let emojis: [String]
        let themeColor: ThemeColor
    }

    private let emojiThemes = [
        Theme(emojis: ["🐶","🐱","🐭","🐹","🐰","🦊","🐻","🐼","🦄","🦁","🐸","🐵","🐷","🐧"],
              themeColor: ThemeColor(backgroundColor: UIColor(rgb: 0x593526),
                                     textBubbleGradientColors: [UIColor(rgb: 0xADDA48), UIColor(rgb: 0x2EC37B)],
                                     cardBackgroundColor: UIColor(rgb: 0xFFBF87), cardBorderColor: UIColor(rgb: 0xE08F79),
                                     newGameButtonBackgroundColor: UIColor(rgb: 0xE08F79), textGUIColor: .white)),

        Theme(emojis: ["😀","😇","😍","😎","🤓","😡","😨","🤯","🤢","😈","😰","🤠","🤡","🤬"],
              themeColor: ThemeColor(backgroundColor: .white,
                                     textBubbleGradientColors: [UIColor(rgb: 0x67CEFF), UIColor(rgb: 0x3D68FF)],
                                     cardBackgroundColor: UIColor(rgb: 0xFFF67F), cardBorderColor: UIColor(rgb: 0xFFCC78),
                                     newGameButtonBackgroundColor: UIColor(rgb: 0x4A90E2), textGUIColor: UIColor(rgb: 0x4A4A4A))),

        Theme(emojis: ["🐳","🦀","🏖","🏝","🛥","🦑","🌊","🐋","🐙","🐚","🐟","🐠","🐡","🐬"],
              themeColor: ThemeColor(backgroundColor: UIColor(rgb: 0x21436B),
                                     textBubbleGradientColors: [UIColor(rgb: 0x48DAD9), UIColor(rgb: 0x2E6FC3)],
                                     cardBackgroundColor: UIColor(rgb: 0xBCDBF9), cardBorderColor: UIColor(rgb: 0xDFEBFD),
                                     newGameButtonBackgroundColor: UIColor(rgb: 0x00C1E0), textGUIColor: .white)),

        Theme(emojis: ["👷‍♀️","👷‍♂️","🚧","🏗","⛑","🔨","⛏","📋","🛑","⚠️","📐","⚒","🔦","🏢"],
              themeColor: ThemeColor(backgroundColor: UIColor(rgb: 0xF4C500),
                                     textBubbleGradientColors: [UIColor(rgb: 0x3D3D3D), .black],
                                     cardBackgroundColor: UIColor(rgb: 0xF8E71C), cardBorderColor: UIColor(rgb: 0xF5A623),
                                     newGameButtonBackgroundColor: .black, textGUIColor: UIColor(rgb: 0x4A4A4A))),

        Theme(emojis: ["🦇","🦉","😱","😈","👹","🤡","👻","💀","🎃","🧛‍♀️","🕷","🕸","🧛‍♂️","🧟‍♀️"],
              themeColor: ThemeColor(backgroundColor: UIColor(rgb: 0x2D1854),
                                     textBubbleGradientColors: [UIColor(rgb: 0xFFBD5F), UIColor(rgb: 0x9E2B60)],
                                     cardBackgroundColor: UIColor(rgb: 0xB8E986), cardBorderColor: UIColor(rgb: 0x64CE77),
                                     newGameButtonBackgroundColor: UIColor(rgb: 0xF5A623), textGUIColor: .white)),

        Theme(emojis: ["🤶","🎄","🎅","❄️","☃️","🎁","🎀","🛍","🔔","😇","🚶‍♀️","👨‍👩‍👧‍👦","🧣","🧤"],
              themeColor: ThemeColor(backgroundColor: UIColor(rgb: 0xD83333),
                                     textBubbleGradientColors: [UIColor(rgb: 0xB4EC51), UIColor(rgb: 0x429321)],
                                     cardBackgroundColor: UIColor(rgb: 0xD7FAFF), cardBorderColor: UIColor(rgb: 0x72CBC8),
                                     newGameButtonBackgroundColor: UIColor(rgb: 0x7ED321), textGUIColor: .white)),
        ]

    mutating func chooseNewRandomEmojiTheme(callback: (ThemeColor) -> Void) {
        emoji.removeAll()
        emojiChoices.removeAll()
        let emojiTheme = emojiThemes[Int.random(in: 0..<emojiThemes.count)]
        emojiChoices = emojiTheme.emojis
        callback(emojiTheme.themeColor)
    }

    mutating func emoji(for cardIdentifier: Int) -> String {
        if emoji[cardIdentifier] == nil, emojiChoices.count > 0 {
            emoji[cardIdentifier] = emojiChoices.remove(at: Int.random(in: 0..<emojiChoices.count))
        }
        return emoji[cardIdentifier] ?? "?"
    }
}
