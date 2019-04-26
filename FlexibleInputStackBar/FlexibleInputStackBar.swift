//
//  FlexibleInputStackBar.swift
//  FlexibleInputStackBar
//
//  Created by 下村 一将 on 2019/04/25.
//  Copyright © 2019 kazuringo. All rights reserved.
//

import UIKit

final class InputAccessoryStackBar: UIView {
    private let leftStackView: UIStackView = {
        let stack = UIStackView()
        stack.axis = .horizontal
        stack.semanticContentAttribute = .forceLeftToRight
        stack.spacing = 16.0
        return stack
    }()
    private let rightStackView: UIStackView = {
        let stack = UIStackView()
        stack.axis = .horizontal
        stack.semanticContentAttribute = .forceRightToLeft
        stack.spacing = 16.0
        return stack
    }()
    private var _backgroundColor: UIColor = UIColor.blue

    convenience init(frame: CGRect, backgroundColor: UIColor) {
        self.init(frame: frame)
        self._backgroundColor = backgroundColor
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()

    }
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        configure()
    }

    private func configure() {
        addSubview(leftStackView)
        addSubview(rightStackView)

        addConstraints([
            NSLayoutConstraint(item: leftStackView, attribute: .left, relatedBy: .equal, toItem: self, attribute: .left,
                               multiplier: 1.0, constant: 16.0),
            NSLayoutConstraint(item: leftStackView, attribute: .top, relatedBy: .equal, toItem: self, attribute: .top,
                               multiplier: 1.0, constant: 0.0),
            NSLayoutConstraint(item: leftStackView, attribute: .bottom, relatedBy: .equal, toItem: self, attribute: .bottom,
                               multiplier: 1.0, constant: 0.0),
            ])

        addConstraints([
            NSLayoutConstraint(item: rightStackView, attribute: .right, relatedBy: .equal, toItem: self, attribute: .right,
                               multiplier: 1.0, constant: -16.0),
            NSLayoutConstraint(item: rightStackView, attribute: .top, relatedBy: .equal, toItem: self, attribute: .top,
                               multiplier: 1.0, constant: 0.0),
            NSLayoutConstraint(item: rightStackView, attribute: .bottom, relatedBy: .equal, toItem: self, attribute: .bottom,
                               multiplier: 1.0, constant: 0.0),
            ])
    }

    func addArrangedSubviewToRight(_ view: UIView) {
        rightStackView.addArrangedSubview(view)
    }

    func addArrangedSubviewToLeft(_ view: UIView) {
        leftStackView.addArrangedSubview(view)
    }
}
