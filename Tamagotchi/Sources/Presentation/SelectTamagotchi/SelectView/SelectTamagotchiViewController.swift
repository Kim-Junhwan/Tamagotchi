//
//  SelectTamagochiViewController.swift
//  Tamagotchi
//
//  Created by JunHwan Kim on 2023/08/04.
//

import UIKit

class SelectTamagotchiViewController: UIViewController {
    
    private enum Sentence {
        static let title: String = "다마고치 선택하기"
    }
    
    private enum Metric {
        static let cellWidth: Double = 110.0
        static let cellHeight: Double = 130.0
        static let spacing: Double = 15.0
    }

    @IBOutlet weak var collectionView: UICollectionView!
    
    var tamagotchiList: [Tamagotchi] = [ .happy, .sting, .twinkle, .empty, .empty, .empty, .empty, .empty, .empty, .empty, .empty, .empty, .empty, .empty, .empty, .empty, .empty, .empty, .empty, .empty]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setCollectionView()
        title = Sentence.title
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
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let selectTamagotchi = tamagotchiList[indexPath.row]
        if selectTamagotchi == .empty {
            return
        }
        let storyboard: UIStoryboard = UIStoryboard(name: StoryBoard.main, bundle: nil)
        guard let vc = storyboard.instantiateViewController(withIdentifier: "TamagotchiDetailPopupViewController") as? TamagotchiDetailPopupViewController else { return }
        vc.selectTamagotchi = selectTamagotchi
        vc.modalPresentationStyle = .overFullScreen
        present(vc, animated: true)
    }
}
