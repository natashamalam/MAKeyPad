//
//  KeyPadView.swift
//  LockScreen
//
//  Created by Alam, Mahjabin | Natasha | ECMPD on 2026/03/12.
//

import UIKit

class KeyPadView: UIView {
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Enter Your Passcode"
        label.font = UIFont.systemFont(ofSize: 24, weight: .bold)
        label.textAlignment = .center
        label.textColor = .label
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let buttonTitles = ["1", "2", "3", "4", "5", "6", "7", "8", "9", "0"]
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .clear
        setupKeyPad()
    }
    
    private func setupKeyPad() {
        // Add title label
        self.addSubview(titleLabel)

        // Create vertical stack view to hold all horizontal rows
        let containerStackView = verticalStackView()

        // Create horizontal rows with 3 buttons each from buttonTitles
        var index = 0
        let buttonsPerRow = 3
        let numberOfRows = (buttonTitles.count + buttonsPerRow - 1) / buttonsPerRow // Ceiling division

        for _ in 0..<numberOfRows {
            let rowStackView = horizontalStackView()
            let remainingButtons = buttonTitles.count - index

            // If only 1 button left, center it by adding spacer first
            if remainingButtons == 1 {
                // Add left spacer
                let leftSpacer = UIView()
                leftSpacer.translatesAutoresizingMaskIntoConstraints = false
                NSLayoutConstraint.activate([
                    leftSpacer.widthAnchor.constraint(equalToConstant: 80)
                ])
                rowStackView.addArrangedSubview(leftSpacer)

                // Add center button
                let button = keyPadButton(with: buttonTitles[index])
                rowStackView.addArrangedSubview(button)
                index += 1

                // Add right spacer
                let rightSpacer = UIView()
                rightSpacer.translatesAutoresizingMaskIntoConstraints = false
                NSLayoutConstraint.activate([
                    rightSpacer.widthAnchor.constraint(equalToConstant: 80)
                ])
                rowStackView.addArrangedSubview(rightSpacer)
            } else {
                // Add 3 buttons per row normally
                for _ in 0..<buttonsPerRow {
                    if index < buttonTitles.count {
                        let button = keyPadButton(with: buttonTitles[index])
                        rowStackView.addArrangedSubview(button)
                        index += 1
                    }
                }
            }

            containerStackView.addArrangedSubview(rowStackView)
        }

        self.addSubview(containerStackView)

        // Constraints for subviews of KeyPadView
        NSLayoutConstraint.activate([
            // Title label constraints
            titleLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 40),
            titleLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            titleLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 10),
            titleLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -10),

            // Container stack view constraints
            containerStackView.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            containerStackView.centerYAnchor.constraint(equalTo: self.centerYAnchor)
        ])
    }
    
    func horizontalStackView() -> UIStackView {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.alignment = .center
        stackView.distribution = .equalSpacing
        stackView.spacing = 10
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }
    
    func verticalStackView() -> UIStackView {
        let stackView = UIStackView()
        stackView.backgroundColor = .clear
        stackView.axis = .vertical
        stackView.alignment = .center
        stackView.distribution = .equalSpacing
        stackView.spacing = 10
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }
    
    func keyPadButton(with title: String) -> KeyPadButton {
        let buttonSize: CGFloat = 80
        let button = KeyPadButton(side: buttonSize, title: title)
        return button
    }
}
