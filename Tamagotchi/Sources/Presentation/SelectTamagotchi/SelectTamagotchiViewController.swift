//
//  SelectTamagochiViewController.swift
//  Tamagotchi
//
//  Created by JunHwan Kim on 2023/08/04.
//

import UIKit

class SelectTamagotchiViewController: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!
    
    var tamagotchiList: [Tamagotchi] = [ .happy, .sting, .twinkle, .empty, .empty, .empty, .empty, .empty, .empty, .empty, .empty, .empty, .empty, .empty, .empty, .empty, .empty, .empty, .empty, .empty]
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    private func setCollectionView() {
        collectionView.delegate = self
        collectionView.dataSource = self
    }

}

extension SelectTamagotchiViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return tamagotchiList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        <#code#>
    }
}
