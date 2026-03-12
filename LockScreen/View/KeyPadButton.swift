//
//  KeyPadButton.swift
//  LockScreen
//
//  Created by Alam, Mahjabin | Natasha | ECMPD on 2026/03/12.
//

import UIKit

class KeyPadButton: UIButton {
    
    var sideFactor: CGFloat = 20
     
    init(side: CGFloat, title: String) {
        self.sideFactor = side
        super.init(frame: .zero)
        setupButton(with: title)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupButton()
    }
    
    private func setupButton(with title: String = "") {
        self.setTitle(title, for: .normal)
        self.setTitleColor(.label, for: .normal)
        self.titleLabel?.font = UIFont.systemFont(ofSize: 24, weight: .bold)

        // Dynamic background color based on system appearance
        self.backgroundColor = UIColor { traitCollection in
            switch traitCollection.userInterfaceStyle {
            case .dark:
                return UIColor.white.withAlphaComponent(0.2)
            default:
                return UIColor.black.withAlphaComponent(0.3)
            }
        }

        self.layer.cornerRadius = sideFactor / 2
        self.clipsToBounds = true

        self.translatesAutoresizingMaskIntoConstraints = false

        let constrainst = [
            self.widthAnchor.constraint(equalToConstant: sideFactor),
            self.heightAnchor.constraint(equalToConstant: sideFactor)
        ]
        NSLayoutConstraint.activate(constrainst)
    }
}
