//
//  SetUserNameViewController.swift
//  Tamagotchi
//
//  Created by JunHwan Kim on 2023/08/07.
//

import UIKit

class SetUserNameViewController: UIViewController {

    @IBOutlet weak var setUserNameTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        makeOptionBarButton()
        setNavigationBar()
        setTextField()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        setUserNameTextField.layoutIfNeeded()
        setUserNameTextField.drawBorderLine(height: 1.5, direction: .bottom)
    }
    
    private func setNavigationBar() {
        title = "\(UserDefaultRepository.userName)님 이름 정하기"
    }
    
    private func setTextField() {
        setUserNameTextField.backgroundColor = .clear
        setUserNameTextField.borderStyle = .none
        setUserNameTextField.placeholder = "대장님 이름을 알려주세요"
        setUserNameTextField.font = DefaultFont.bold.font(size: .big)
        setUserNameTextField.textAlignment = .left
        setUserNameTextField.text = UserDefaultRepository.userName
        setUserNameTextField.textColor = DefaultColor.defualtFontColor
    }
    
    private func makeOptionBarButton() {
        let optionButton = UIBarButtonItem(title: "저장", style: .done, target: self, action: #selector(saveUserName))
        optionButton.tintColor = DefaultColor.defualtFontColor
        navigationItem.setRightBarButtonItems([optionButton], animated: true)
    }
    
    @objc func saveUserName() {
        guard let name = setUserNameTextField.text else { return }
        if checkIsCorrectName(name: name) {
            UserDefaultRepository.userName = name
            self.navigationController?.popViewController(animated: true)
        }
    }
    
    func checkIsCorrectName(name: String) -> Bool {
        if name.count < 2 || name.count > 6{
            return false
        }
        return true
    }

}
