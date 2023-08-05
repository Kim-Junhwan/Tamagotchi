//
//  SelectTamagotchiCollectionViewCell.swift
//  Tamagotchi
//
//  Created by JunHwan Kim on 2023/08/05.
//

import UIKit

class SelectTamagotchiCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var tamagotchiProfileView: TamagotchiProfileView!
    
    static let identifier: String = "SelectTamagotchiCollectionViewCell"

    
    func configureCell(tamagotchi: Tamagotchi) {
        tamagotchiProfileView.tamagotchImageView.image = tamagotchi.image
        tamagotchiProfileView.nameLabel.text = tamagotchi.name
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }

}
