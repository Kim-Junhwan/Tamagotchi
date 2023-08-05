//
//  SelectTamagotchiCollectionViewCell.swift
//  Tamagotchi
//
//  Created by JunHwan Kim on 2023/08/05.
//

import UIKit

class SelectTamagotchiCollectionViewCell: UICollectionViewCell {
    
    static let identifier: String = "SelectTamagotchiCollectionViewCell"

    @IBOutlet weak var tamagotchiImageView: UIImageView!
    @IBOutlet weak var nameLabel: DefaultLabel!
    
    func configureCell(tamagotchi: Tamagotchi) {
        tamagotchiImageView.image = tamagotchi.image
        nameLabel.text = tamagotchi.name
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }

}
