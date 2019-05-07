//
//  ViewController.swift
//  Demo
//
//  Created by Kazumasa Shimomura on 2019/04/25.
//  Copyright © 2019 kazuringo. All rights reserved.
//

import UIKit
import FlexibleInputStackBar

class ViewController: UIViewController {
    private let textField: UITextField = {
        let field = UITextField()
        field.backgroundColor = .lightGray
        field.enablesReturnKeyAutomatically = true
        field.returnKeyType = .done
        return field
    }()

    private lazy var flexibleInputStackBar: FlexibleInputStackBar = {
        let bar = FlexibleInputStackBar(height: 40)
        bar.backgroundColor = #colorLiteral(red: 0.03529411765, green: 0.5176470588, blue: 0.8901960784, alpha: 1)
        bar.addArrangedSubviewToLeft(leftButton1)
        bar.addArrangedSubviewToLeft(leftButton2)
        bar.addArrangedSubviewToRight(rightButton1)
        bar.addArrangedSubviewToRight(rightButton2)
        return bar
    }()
    private lazy var leftButton1: UIButton = createButton(title: "L1")
    private lazy var leftButton2: UIButton = createButton(title: "L2")
    private lazy var rightButton1: UIButton = createButton(title: "R1")
    private lazy var rightButton2: UIButton = createButton(title: "R2")

    override var inputAccessoryView: UIView? { return flexibleInputStackBar }
    override var canBecomeFirstResponder: Bool { return true } // if you set true, always input bar is shown.

    override func viewDidLoad() {
        super.viewDidLoad()

        view.addSubview(textField)
        textField.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            textField.topAnchor.constraint(equalTo: view.topAnchor, constant: 32),
            textField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            textField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            textField.heightAnchor.constraint(equalToConstant: 30.0),
            ])

        textField.becomeFirstResponder()
        textField.delegate = self
    }

    private func createButton(title: String) -> UIButton {
        let button = UIButton(frame: .init())
        button.setTitle(title, for: .normal)
        button.tintColor = .white
        button.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
        return button
    }

    @objc private func buttonTapped(button: UIButton) {
        let alert = UIAlertController(title: "\(button.title(for: .normal) ?? "nil") was tapped😎", message: nil, preferredStyle: .alert)
        present(alert, animated: true) {
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5, execute: {
                alert.dismiss(animated: true)
            })
        }
    }
}

extension ViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}
