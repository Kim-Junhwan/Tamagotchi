//
//  TamagotchiImageView.swift
//  Tamagotchi
//
//  Created by JunHwan Kim on 2023/08/05.
//

import UIKit

class TamagotchiProfileView: UIView {

    @IBOutlet weak var tamagotchImageView: UIImageView!
    @IBOutlet weak var nameLabel: DefaultLabel!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        commonInit()
    }
    
    private func commonInit() {
        guard let view = Bundle.main.loadNibNamed("TamagotchiProfileView", owner: self)?.first as? UIView else { return }
        view.frame = bounds
        addSubview(view)
    }
    
    

}
