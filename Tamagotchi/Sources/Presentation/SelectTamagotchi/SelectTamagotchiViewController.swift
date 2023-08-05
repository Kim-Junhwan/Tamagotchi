//
//  SelectTamagochiViewController.swift
//  Tamagotchi
//
//  Created by JunHwan Kim on 2023/08/04.
//

import UIKit

class SelectTamagotchiViewController: UIViewController {
    
    private enum Metric {
        static let cellWidth: Double = 110.0
        static let cellHeight: Double = 130.0
        static let spacing: Double = 15.0
    }

    @IBOutlet weak var collectionView: UICollectionView!
    
    var tamagotchiList: [Tamagotchi] = [ .happy, .sting, .twinkle, .empty, .empty, .empty, .empty, .empty, .empty, .empty, .empty, .empty, .empty, .empty, .empty, .empty, .empty, .empty, .empty, .empty]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func updateViewConstraints() {
        super.updateViewConstraints()
        setCollectionView()
    }
    
    private func makeCollectionViewLayout() -> UICollectionViewFlowLayout {
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.minimumLineSpacing = Metric.spacing
        flowLayout.minimumInteritemSpacing = Metric.spacing
        flowLayout.sectionInset = UIEdgeInsets(top: .zero, left: Metric.spacing, bottom: .zero, right: Metric.spacing)
        flowLayout.itemSize = CGSize(width: Metric.cellWidth, height: Metric.cellHeight)
        return flowLayout
    }
    
    private func setCollectionView() {
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(UINib(nibName: SelectTamagotchiCollectionViewCell.identifier, bundle: nil), forCellWithReuseIdentifier: SelectTamagotchiCollectionViewCell.identifier)
        collectionView.collectionViewLayout = makeCollectionViewLayout()
    }
    
    

}

extension SelectTamagotchiViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return tamagotchiList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: SelectTamagotchiCollectionViewCell.identifier, for: indexPath) as? SelectTamagotchiCollectionViewCell else { return UICollectionViewCell() }
        cell.configureCell(tamagotchi: tamagotchiList[indexPath.row])
        return cell
    }
}
