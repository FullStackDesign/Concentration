//
//  ViewController.swift
//  Concentration
//
//  Created by Ricky on 3/13/18.
//  Copyright © 2018 Full Stack Design. All rights reserved.
//

import UIKit

class ConcentrationViewController: UIViewController {

    var cardButtons = [UIButton]()
    let cardGrid = [[Int]](repeating: Array(repeating: 0, count: 4), count: 6)

    let mainStackView: UIStackView = {
        let stackView = UIStackView(axis: .vertical, distribution: .fillEqually)
        stackView.spacing = 16
        return stackView
    }()

    let labelStackView: UIStackView = {
        let stackView = UIStackView(axis: .horizontal, distribution: .equalSpacing)
        return stackView
    }()

    let flipCountLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 20, weight: .black)
        label.text = "Flips:0"
        label.textAlignment = .center
        return label
    }()

    let gameScoreLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 20, weight: .black)
        label.text = "⭐️0"
        label.textAlignment = .center
        return label
    }()

    let textBubbleBackground: UIView = {
        let background = UIView()
        background.backgroundColor = .blue
        background.translatesAutoresizingMaskIntoConstraints = false
        return background
    }()

    let newGameButton: UIButton = {
        let button = UIButton(type: .system)
        button.backgroundColor = .blue
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        newGameButton.addTarget(self, action: #selector(newGame), for: .touchUpInside)
        [flipCountLabel, gameScoreLabel].forEach{ labelStackView.addArrangedSubview($0) }
        [labelStackView, textBubbleBackground, newGameButton].forEach{ view.addSubview($0) }
        textBubbleBackground.addSubview(mainStackView)
        setupButtonStackView()
        setupConstraints()
    }

    func setupConstraints() {
        labelStackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        labelStackView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 16).isActive = true
        labelStackView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -16).isActive = true

        textBubbleBackground.topAnchor.constraint(lessThanOrEqualTo: labelStackView.bottomAnchor, constant: 400).isActive = true
        textBubbleBackground.bottomAnchor.constraint(equalTo: newGameButton.topAnchor, constant: -16).isActive = true
        textBubbleBackground.leadingAnchor.constraint(greaterThanOrEqualTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 16).isActive = true
        textBubbleBackground.trailingAnchor.constraint(greaterThanOrEqualTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -16).isActive = true
        textBubbleBackground.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor).isActive = true
        textBubbleBackground.centerYAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerYAnchor).isActive = true

        let mainStackViewHeightConstraint = mainStackView.heightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.heightAnchor, multiplier: 1)
        mainStackViewHeightConstraint.priority = UILayoutPriority(rawValue: 999)
        mainStackViewHeightConstraint.isActive = true

        mainStackView.topAnchor.constraint(equalTo: textBubbleBackground.topAnchor, constant: 16).isActive = true
        mainStackView.leadingAnchor.constraint(equalTo: textBubbleBackground.leadingAnchor, constant: 16).isActive = true
        mainStackView.trailingAnchor.constraint(equalTo: textBubbleBackground.trailingAnchor, constant: -19).isActive = true
        mainStackView.bottomAnchor.constraint(equalTo: textBubbleBackground.bottomAnchor, constant: -16).isActive = true

        newGameButton.heightAnchor.constraint(equalToConstant: 52).isActive = true
        newGameButton.widthAnchor.constraint(equalTo: newGameButton.heightAnchor, multiplier: 1).isActive = true
        newGameButton.bottomAnchor.constraint(lessThanOrEqualTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -8).isActive = true
        newGameButton.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor).isActive = true

        cardButtons[0].widthAnchor.constraint(equalTo: cardButtons[0].heightAnchor, multiplier: 1).isActive = true
    }

    func setupButtonStackView() {
        for row in cardGrid {
            let rowStackView = UIStackView(axis: .horizontal, distribution: .fillEqually)
            rowStackView.spacing = 16
            mainStackView.addArrangedSubview(rowStackView)
            for _ in row {
                let button = UIButton(type: .system)
                button.addTarget(self, action: #selector(touchCard), for: .touchUpInside)
                button.backgroundColor = .yellow
                button.translatesAutoresizingMaskIntoConstraints = false
                rowStackView.addArrangedSubview(button)
                cardButtons.append(button)
            }
        }
    }

    @objc func touchCard(_ sender: UIButton) {

    }

    @objc func newGame(_ sender: UIButton) {

    }
}

