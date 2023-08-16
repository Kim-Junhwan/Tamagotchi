//
//  SetUserNameViewController.swift
//  Tamagotchi
//
//  Created by JunHwan Kim on 2023/08/07.
//

import UIKit

enum UserNameError: Error {
    case outOfScope
    case sameName
}

class SetUserNameViewController: UIViewController, Alertable {

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
        do {
            try saveUserNameAtUserDefaults(userName: name)
        } catch UserNameError.outOfScope {
            errorAlert(message: "2~6자리의 닉네임을 입력해주세요")
        } catch UserNameError.sameName {
            errorAlert(message: "같은 닉네임 입니다.")
        } catch {
            print(error)
        }
    }
    
    func saveUserNameAtUserDefaults(userName: String) throws {
        guard userName.count >= 2 && userName.count <= 6 else {
            throw UserNameError.outOfScope
        }
        
        guard UserDefaultRepository.userName != userName else {
            throw UserNameError.sameName
        }
        
        UserDefaultRepository.userName = userName
        self.navigationController?.popViewController(animated: true)
    }

}
