//
//  OptionListViewController.swift
//  Tamagotchi
//
//  Created by JunHwan Kim on 2023/08/07.
//

import UIKit

class OptionListViewController: UIViewController, Alertable {

    @IBOutlet weak var tableView: UITableView!
    
    let optionListTitle: [String] = ["내 이름 설정하기", "다마고치 변경하기", "데이터 초기화"]
    let optionListImage: [UIImage?] = [UIImage(systemName: "pencil"), UIImage(systemName: "moon.fill"), UIImage(systemName: "arrow.clockwise")]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setNavigationBar()
        setTableView()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        tableView.reloadData()
    }
    
    private func setNavigationBar() {
        title = "설정"
        
    }
    
    private func setTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.backgroundColor = .clear
        tableView.register(UINib(nibName: OptionTableViewCell.identifier, bundle: nil), forCellReuseIdentifier: OptionTableViewCell.identifier)
    }

}

extension OptionListViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return optionListTitle.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: OptionTableViewCell.identifier) as? OptionTableViewCell else { return UITableViewCell() }
        cell.titleLabel?.text = optionListTitle[indexPath.row]
        cell.imageView?.image = optionListImage[indexPath.row]
        cell.subtitleLabel.text = ""
        if indexPath.row == 0 {
            cell.subtitleLabel?.text = UserDefaultRepository.userName
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let storyboard = UIStoryboard(name: StoryBoard.main, bundle: nil)
        let viewController: UIViewController
        if indexPath.row == 0 {
            viewController = storyboard.instantiateViewController(identifier: "SetUserNameViewController")
        } else if indexPath.row == 1 {
            viewController = storyboard.instantiateViewController(withIdentifier: ViewControllerIdenfier.selectTama)
        } else {
            let defaultAction = UIAlertAction(title: "응", style: .default) { _ in
                UserDefaultRepository.eatRiceCount = 0
                UserDefaultRepository.eatWaterDropCount = 0
                UserDefaultRepository.exp = 0.0
                UserDefaultRepository.isLaunched = false
                UserDefaultRepository.userName = "대장"
                self.changeRootView(viewControllerIdentifier: ViewControllerIdenfier.selectTama)
            }
            showAlert(title: "데이터 초기화", message: "정말 다시 처음부터 시작하실 건가용?", cancelActionTitle: "아냐!", defaultActionBlock: defaultAction)
            return
        }
        navigationController?.pushViewController(viewController, animated: true)
    }
}
