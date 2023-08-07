//
//  OptionTableViewCell.swift
//  Tamagotchi
//
//  Created by JunHwan Kim on 2023/08/07.
//

import UIKit

class OptionTableViewCell: UITableViewCell {
    static let identifier: String = "OptionTableViewCell"

    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var subtitleLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        backgroundColor = .clear
        titleLabel.font = DefaultFont.bold.font(size: .medium)
        titleLabel.textColor = DefaultColor.defualtFontColor
        subtitleLabel.textColor = .gray
        subtitleLabel.font = DefaultFont.bold.font(size: .medium)
        imageView?.tintColor = DefaultColor.defualtFontColor
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
