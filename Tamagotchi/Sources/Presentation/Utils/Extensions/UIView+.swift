//
//  UIView+.swift
//  Tamagotchi
//
//  Created by JunHwan Kim on 2023/08/06.
//

import UIKit

enum ViewDirection {
    case top
    case bottom
}

extension UIView {
    func drawBorderLine(height: Double, direction: ViewDirection) {
        let border = CALayer()
        let width = self.bounds.width
        let height = height
        let borderFrame: CGRect
        switch direction {
        case .top:
            borderFrame = CGRect(x: 0, y: 0, width: width, height: height)
        case .bottom:
            borderFrame = CGRect(x: 0, y: self.frame.maxY, width: width, height: height)
        }
        border.frame = borderFrame
        border.backgroundColor = DefaultColor.defualtFontColor.cgColor
        self.layer.addSublayer(border)
    }
}
