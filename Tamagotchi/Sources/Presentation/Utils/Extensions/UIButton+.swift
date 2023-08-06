//
//  UIButton+.swift
//  Tamagotchi
//
//  Created by JunHwan Kim on 2023/08/06.
//

import UIKit

extension UIButton {
    static func makeDefaultButtonConfiguration(backgroundColor: UIColor,
                                               font: UIFont,
                                               image: UIImage? = nil,
                                               textColor: UIColor,
                                               title: String,
                                               cornerRadius: Double) -> UIButton.Configuration
    {
        var config = UIButton.Configuration.filled()
        var titleAttribute = AttributedString(title)
        titleAttribute.font = font
        titleAttribute.foregroundColor = textColor
        config.baseBackgroundColor = backgroundColor
        config.attributedTitle = titleAttribute
        config.background.cornerRadius = cornerRadius
        return config
    }
}
