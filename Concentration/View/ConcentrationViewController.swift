//
//  ViewController.swift
//  Concentration
//
//  Created by Ricky on 3/13/18.
//  Copyright © 2018 Full Stack Design. All rights reserved.
//

import UIKit

class ConcentrationViewController: UIViewController {
    private var cardButtons = [UIButton]()
    private let cardGrid = [[Int]](repeating: Array(repeating: 0, count: 4), count: 6)
    private lazy var game = Concentration(numberOfPairsOfCards: (numberOfPairsOfCards))
    private var currentCardBackgroundColor: UIColor?
    private var emojiTheme = Emoji()

    private var numberOfPairsOfCards: Int {
        return (cardButtons.count + 1) / 2
    }

    private let mainStackView: UIStackView = {
        let stackView = UIStackView(axis: .vertical, distribution: .fillEqually)
        return stackView
    }()

    private let labelStackView: UIStackView = {
        let stackView = UIStackView(axis: .horizontal, distribution: .equalSpacing)
        return stackView
    }()

    private let flipCountLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 20, weight: .black)
        label.text = "Flips:0"
        label.textAlignment = .center
        return label
    }()

    private let gameScoreLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 20, weight: .black)
        label.text = "⭐️0"
        label.textAlignment = .center
        return label
    }()

    private let textBubbleBackground: UIView = {
        let background = UIView()
        background.backgroundColor = .blue
        background.translatesAutoresizingMaskIntoConstraints = false
        return background
    }()

    private let textBubbleMaskImage: UIImageView = {
        let imageView = UIImageView(image: #imageLiteral(resourceName: "TextBubble"))
        return imageView
    }()

    private let newGameButton: UIButton = {
        let button = UIButton(type: .system)
        button.setImage(#imageLiteral(resourceName: "RetryIcon"), for: .normal)
        button.tintColor = .white
        button.imageEdgeInsets = UIEdgeInsets.init(top: 8, left: 8, bottom: 8, right: 8)
        button.backgroundColor = .blue
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    private lazy var gradientView: Gradient = {
        let gradient = Gradient(frame: view.frame, colors: [UIColor(rgb: 0x67CEFF), UIColor(rgb: 0x3D68FF)], startPoint: CGPoint(x: 0.0, y: 0.05), endPoint: CGPoint(x: 0.0, y: 0.8), location: [0.0, 0.45])
        return gradient
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        newGameButton.addTarget(self, action: #selector(newGame), for: .touchUpInside)
        [flipCountLabel, gameScoreLabel].forEach{ labelStackView.addArrangedSubview($0) }
        [labelStackView, textBubbleBackground, newGameButton].forEach{ view.addSubview($0) }
        [gradientView, mainStackView].forEach{ textBubbleBackground.addSubview($0)}
        textBubbleBackground.mask = textBubbleMaskImage
        setupButtonStackView()
        setupConstraints()
        setUIComponentsScaleFactor()
        emojiTheme.chooseNewRandomEmojiTheme {setThemeColors(themeColor: $0)}
    }

    override func viewDidLayoutSubviews() {
        newGameButton.layer.cornerRadius = newGameButton.bounds.size.height / 2
        textBubbleMaskImage.frame = textBubbleBackground.bounds
    }

    private func setUIComponentsScaleFactor() {
        view.setNeedsLayout()
        view.layoutIfNeeded()
        mainStackView.spacing = ((mainStackView.bounds.height + 16 * 5) * 0.0295202952).rounded(.toNearestOrAwayFromZero)
        mainStackView.arrangedSubviews.forEach { (view) in
            if let stackView = view as? UIStackView {
                stackView.spacing = ((mainStackView.bounds.width + 16 * 3) * 0.04494382022).rounded(.toNearestOrAwayFromZero)
            }
        }
        view.setNeedsLayout()
        view.layoutIfNeeded()
        cardButtons.forEach { (button) in
            button.layer.shadowOffset = CGSize(width: 0, height: (button.bounds.height * 0.1363636364).rounded(.towardZero))
            button.titleLabel?.font = UIFont.systemFont(ofSize: button.bounds.height / 2)
            button.layer.cornerRadius = (button.bounds.width * 0.25).rounded(.towardZero)
            button.layer.borderWidth = (button.bounds.width * 0.25).rounded(.towardZero) / 2
        }
    }

    private func setupConstraints() {
        labelStackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        labelStackView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 16).isActive = true
        labelStackView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -16).isActive = true

        textBubbleBackground.topAnchor.constraint(lessThanOrEqualTo: labelStackView.bottomAnchor, constant: 400).isActive = true
        textBubbleBackground.bottomAnchor.constraint(equalTo: newGameButton.topAnchor, constant: -16).isActive = true
        textBubbleBackground.leadingAnchor.constraint(greaterThanOrEqualTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 16).isActive = true
        textBubbleBackground.trailingAnchor.constraint(lessThanOrEqualTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -16).isActive = true
        textBubbleBackground.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor).isActive = true
        textBubbleBackground.centerYAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerYAnchor).isActive = true

        let mainStackViewHeightConstraint = mainStackView.heightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.heightAnchor, multiplier: 1)
        mainStackViewHeightConstraint.priority = UILayoutPriority(rawValue: 999)
        mainStackViewHeightConstraint.isActive = true

        mainStackView.heightAnchor.constraint(equalTo: textBubbleBackground.heightAnchor, multiplier: 0.936843).isActive = true
        mainStackView.widthAnchor.constraint(equalTo: textBubbleBackground.widthAnchor, multiplier: 0.906706).isActive = true
        mainStackView.centerXAnchor.constraint(equalTo: textBubbleBackground.centerXAnchor).isActive = true
        mainStackView.centerYAnchor.constraint(equalTo: textBubbleBackground.centerYAnchor).isActive = true

        newGameButton.heightAnchor.constraint(equalToConstant: 52).isActive = true
        newGameButton.widthAnchor.constraint(equalTo: newGameButton.heightAnchor, multiplier: 1).isActive = true
        newGameButton.bottomAnchor.constraint(lessThanOrEqualTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -8).isActive = true
        newGameButton.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor).isActive = true

        cardButtons[0].widthAnchor.constraint(equalTo: cardButtons[0].heightAnchor, multiplier: 1).isActive = true
    }

    private func setupButtonStackView() {
        for row in cardGrid {
            let rowStackView = UIStackView(axis: .horizontal, distribution: .fillEqually)
            mainStackView.addArrangedSubview(rowStackView)
            for _ in row {
                let button = UIButton(type: .system)
                button.addTarget(self, action: #selector(touchCard), for: .touchUpInside)
                button.layer.shadowColor = UIColor.black.cgColor
                button.layer.shadowOpacity = 0.12
                button.layer.shadowRadius = 0
                button.translatesAutoresizingMaskIntoConstraints = false
                rowStackView.addArrangedSubview(button)
                cardButtons.append(button)
            }
        }
    }

    private func setThemeColors(themeColor: ThemeColor) {
        for button in cardButtons {
            button.backgroundColor = themeColor.cardBackgroundColor
            button.layer.borderColor = themeColor.cardBorderColor.cgColor
        }
        guard let viewLayer = gradientView.layer as? CAGradientLayer else {
            fatalError("Failed to cast layer to CAGradientLayer")
        }
        viewLayer.colors = themeColor.textBubbleGradientColors.map({$0.cgColor})
        gameScoreLabel.textColor = themeColor.textGUIColor
        flipCountLabel.textColor = themeColor.textGUIColor
        currentCardBackgroundColor = themeColor.cardBackgroundColor
        newGameButton.backgroundColor = themeColor.newGameButtonBackgroundColor
        view.backgroundColor = themeColor.backgroundColor
    }

    @objc func touchCard(_ sender: UIButton) {
        guard let cardNumber = cardButtons.index(of: sender) else { fatalError("Chosen card was not found" )}
        game.chooseCard(at: cardNumber)
        updateViewFromModel()
    }

    @objc func newGame(_ sender: UIButton) {
        game.newGame(numberOfPairsOfCards: numberOfPairsOfCards)
        emojiTheme.chooseNewRandomEmojiTheme {setThemeColors(themeColor: $0)}
        updateViewFromModel()
    }

    private func updateViewFromModel() {
        flipCountLabel.text? = "Flips:\(game.flipCount)"
        gameScoreLabel.text? = "⭐️\(game.gameScore)"
        for index in cardButtons.indices {
            let button = cardButtons[index]
            let card = game.cards[index]
            if card.isFaceUp {
                button.setTitle(emojiTheme.emoji(for: card.identifier), for: .normal)
                button.backgroundColor = .white
                button.layer.borderWidth = 0
            } else {
                button.setTitle("", for: .normal)
                button.backgroundColor = card.isMatched ? .clear : currentCardBackgroundColor
                if card.isMatched {
                    button.layer.borderWidth = 0
                } else {
                    button.layer.cornerRadius = (button.bounds.width * 0.25).rounded(.towardZero)
                    button.layer.borderWidth = (button.bounds.width * 0.25).rounded(.towardZero) / 2
                }
            }
        }
    }
}

