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
                                               imagePadding: Double = 1.0,
                                               textColor: UIColor,
                                               title: String,
                                               cornerRadius: Double,
                                               borderWidth: Double = 0.0) -> UIButton.Configuration
    {
        var config = UIButton.Configuration.filled()
        var titleAttribute = AttributedString(title)
        config.baseForegroundColor = textColor
        titleAttribute.font = font
        config.baseBackgroundColor = backgroundColor
        config.attributedTitle = titleAttribute
        config.background.cornerRadius = cornerRadius
        config.background.strokeWidth = borderWidth
        config.background.strokeColor = DefaultColor.defualtFontColor
        if image != nil {
            config.image = image
            config.imagePadding = imagePadding
        }
        return config
    }
}
