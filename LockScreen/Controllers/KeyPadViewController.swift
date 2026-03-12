//
//  KeyPadViewController.swift
//  LockScreen
//
//  Created by Alam, Mahjabin | Natasha | ECMPD on 2026/03/12.
//

import UIKit

class KeyPadViewController: UIViewController {
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        self.view.backgroundColor = .white
    }
    
    var keyPadView: KeyPadView = {
        let view = KeyPadView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupKeyPad()
    }
    
    func setupKeyPad() {
        self.view.addSubview(keyPadView)
        
        NSLayoutConstraint.activate([
            keyPadView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            keyPadView.centerYAnchor.constraint(equalTo: self.view.centerYAnchor),
            keyPadView.widthAnchor.constraint(equalTo: self.view.widthAnchor, multiplier: 0.8),
            keyPadView.heightAnchor.constraint(equalTo: self.view.heightAnchor, multiplier: 0.8)
        ])
    }
}
