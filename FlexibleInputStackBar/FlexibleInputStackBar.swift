//
//  FlexibleInputStackBar.swift
//  FlexibleInputStackBar
//
//  Created by Kazumasa Shimomura on 2019/04/25.
//  Copyright © 2019 kazuringo. All rights reserved.
//

import UIKit

public final class FlexibleInputStackBar: UIView {
    public struct Configuration {
        public var itemSpacing: CGFloat
        public var leftStackViewMargin: CGFloat
        public var rightStackViewMargin: CGFloat

        public static var `default`: Configuration {
            return .init(itemSpacing: 8.0, leftStackViewMargin: 8.0, rightStackViewMargin: 8.0)
        }
    }

    private let leftStackView: UIStackView = {
        let stack = UIStackView()
        stack.axis = .horizontal
        stack.semanticContentAttribute = .forceLeftToRight
        stack.distribution = .equalSpacing
        return stack
    }()
    private let rightStackView: UIStackView = {
        let stack = UIStackView()
        stack.axis = .horizontal
        stack.semanticContentAttribute = .forceLeftToRight
        stack.distribution = .equalSpacing
        return stack
    }()
    public var configuration: Configuration = .default {
        didSet {
            configurationDidUpdate(configuration)
        }
    }

    public convenience init(height: Double) {
        self.init(frame: .init(x: 0.0, y: 0.0, width: 0.0, height: height))
    }

    private override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    public required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        configure()
    }

    private func configure() {
        addSubview(leftStackView)
        addSubview(rightStackView)

        translatesAutoresizingMaskIntoConstraints = false
        leftStackView.translatesAutoresizingMaskIntoConstraints = false
        rightStackView.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            leftStackView.topAnchor.constraint(equalTo: topAnchor),
            leftStackView.leftAnchor.constraint(equalTo: leftAnchor, constant: configuration.leftStackViewMargin),
            leftStackView.bottomAnchor.constraint(equalTo: bottomAnchor),
            ])

        NSLayoutConstraint.activate([
            rightStackView.topAnchor.constraint(equalTo: topAnchor),
            rightStackView.rightAnchor.constraint(equalTo: rightAnchor, constant: -configuration.rightStackViewMargin),
            rightStackView.bottomAnchor.constraint(equalTo: bottomAnchor),
            ])

        configurationDidUpdate(.default)
    }

    public func addArrangedSubviewToRight(_ view: UIView) {
        rightStackView.addArrangedSubview(view)
    }

    public func addArrangedSubviewToLeft(_ view: UIView) {
        leftStackView.addArrangedSubview(view)
    }

    private func configurationDidUpdate(_ configuration: Configuration) {
        [self.leftStackView, self.rightStackView].forEach {
            $0.spacing = configuration.itemSpacing
        }
    }
}
