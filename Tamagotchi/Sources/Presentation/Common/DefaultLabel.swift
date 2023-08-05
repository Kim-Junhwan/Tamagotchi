//
//  DefaultLabel.swift
//  Tamagotchi
//
//  Created by JunHwan Kim on 2023/08/05.
//

import UIKit

class DefaultLabel: UILabel {
    
    private enum Metric {
        static let upDownSpacing: Double = 5.0
        static let leftRightSpacing: Double = 5.0
        static let nameLabelBorderWidth: Double = 1.0
        static let nameLabelCornerRadius: Double = 5.0
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        commonInit()
    }
    
    private func commonInit() {
        adjustsFontSizeToFitWidth = true
        font = DefaultFont.bold.font(size: .big)
        layer.borderWidth = Metric.nameLabelBorderWidth
        layer.cornerRadius = Metric.nameLabelCornerRadius
        layer.borderColor = DefaultColor.defualtFontColor.cgColor
    }
    
    override func drawText(in rect: CGRect) {
        super.drawText(in: rect.inset(by: UIEdgeInsets(top: Metric.upDownSpacing, left: Metric.leftRightSpacing, bottom: Metric.upDownSpacing, right: Metric.leftRightSpacing)))
    }
    
    override var intrinsicContentSize: CGSize {
        var contentSize = super.intrinsicContentSize
        contentSize.height += (Metric.upDownSpacing * 2)
        contentSize.width += (Metric.leftRightSpacing * 2)
        return contentSize
    }
}
