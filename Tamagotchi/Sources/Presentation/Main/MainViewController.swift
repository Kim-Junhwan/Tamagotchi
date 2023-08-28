//
//  MainViewController.swift
//  Tamagotchi
//
//  Created by JunHwan Kim on 2023/08/04.
//

import UIKit

class MainViewController: UIViewController {

    @IBOutlet weak var speechLabel: UILabel!
    @IBOutlet weak var tamagotchiProfileView: TamagotchiProfileView!
    @IBOutlet weak var levelLabel: UILabel!
    @IBOutlet weak var waterDropLabel: UILabel!
    @IBOutlet weak var riceCountLabel: UILabel!
    @IBOutlet weak var feedRiceTextField: UITextField!
    @IBOutlet weak var feedRiceButton: UIButton!
    @IBOutlet weak var feedWaterTextField: UITextField!
    @IBOutlet weak var feedWaterButton: UIButton!
    @IBOutlet weak var statusLabelStackView: UIStackView!
    
    let tamagotchiController: TamagotchiController = DefaultTamagotchiController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tamagotchiProfileView.tamagotchImageView.image = tamagotchiController.tamagotchiImage
        tamagotchiProfileView.nameLabel.text = tamagotchiController.tamagotchiName
        layoutButton(button: feedRiceButton, title: "밥먹기", image: UIImage(systemName: "drop.circle"))
        layoutButton(button: feedWaterButton, title: "물먹기", image: UIImage(systemName: "leaf.circle"))
        layoutStatusLabelStackView(stackView: statusLabelStackView)
        makeOptionBarButton()
        title = UserDefaultRepository.userName
        receiveSetUserNameNotify()
    }
    
    private func receiveSetUserNameNotify() {
        NotificationCenter.default.addObserver(self, selector: #selector(updateUserName(notification:)), name: .init("username"), object: nil)
    }
    
    @objc func updateUserName(notification: NSNotification) {
        if let name = notification.userInfo?["name"] as? String {
            title = "\(name)님의 다마고치"
        }
    }
    
    private func updateStatus() {
        levelLabel.text = String(tamagotchiController.level.value)
        riceCountLabel.text = String(tamagotchiController.eatRiceCount)
        waterDropLabel.text = String(tamagotchiController.eatWaterDropCount)
        tamagotchiProfileView.tamagotchImageView.image = tamagotchiController.tamagotchiImage
        speechLabel.text = tamagotchiController.currentSpeech
    }
    
    func layoutStatusLabelStackView(stackView: UIStackView) {
        for subView in stackView.arrangedSubviews {
            if let label = subView as? UILabel {
                label.font = DefaultFont.bold.font(size: .big)
                label.textColor = DefaultColor.defualtFontColor
            } else {
                guard let subStackView = subView as? UIStackView else { return }
                self.layoutStatusLabelStackView(stackView: subStackView)
            }
        }
    }
    
    override func updateViewConstraints() {
        super.updateViewConstraints()
        layoutTextField(textField: feedRiceTextField, placeHolder: "밥주세용")
        layoutTextField(textField: feedWaterTextField, placeHolder: "물주세용")
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        tamagotchiController.updateStatus()
        updateStatus()
        
        speechLabel.textColor = DefaultColor.defualtFontColor
        speechLabel.font = DefaultFont.bold.font(size: .big)
    }
    
    private func layoutButton(button: UIButton, title: String, image: UIImage?) {
        let buttonConfiguration = UIButton.makeDefaultButtonConfiguration(backgroundColor: .clear, font: DefaultFont.bold.font(size: .big), image: image, imagePadding: 5.0, textColor: DefaultColor.defualtFontColor, title: title, cornerRadius: 10.0, borderWidth: 1.0)
        button.configuration = buttonConfiguration
    }
    
    private func layoutTextField(textField: UITextField, placeHolder: String) {
        textField.backgroundColor = .clear
        textField.borderStyle = .none
        textField.placeholder = placeHolder
        textField.font = DefaultFont.bold.font(size: .big)
        textField.textAlignment = .center
        textField.drawBorderLine(height: 1.5, direction: .bottom)
        textField.keyboardType = .numberPad
        textField.textColor = DefaultColor.defualtFontColor
        textField.clipsToBounds = true
    }
    
    @IBAction func feedRiceButton(_ sender: UIButton) {
        let num = textFieldLogic(textField: feedRiceTextField)
        feed(food: Rice(), eatCount: num)
    }
    
    private func feed(food: Eatable, eatCount: Int) {
        do {
            try tamagotchiController.feed(food, num: eatCount)
            updateStatus()
        } catch FeedingError.toomuchFeed {
            speechLabel.text = "한꺼번에 이렇게 많은 밥을 먹을 수 없어요."
        } catch {
            print("unknownError: \(error)")
        }
    }
    
    func textFieldLogic(textField: UITextField) -> Int {
        guard let textFieldText = textField.text else { return 1 }
        let num: Int
        if textFieldText == "" || textFieldText == "0" {
            num = 1
        } else {
            num = Int(textFieldText) ?? .zero
        }
        textField.text = ""
        return num
    }
    
    @IBAction func feedWaterButton(_ sender: UIButton) {
        let num = textFieldLogic(textField: feedWaterTextField)
        feed(food: WaterDrop(), eatCount: num)
    }
    
    func makeOptionBarButton() {
        let optionButton = UIBarButtonItem(image: UIImage(systemName: "person.circle"), style: .done, target: self, action: #selector(pushOptionView))
        optionButton.tintColor = DefaultColor.defualtFontColor
        navigationItem.setRightBarButtonItems([optionButton], animated: true)
        let backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: self, action: nil)
        self.navigationItem.backBarButtonItem = backBarButtonItem
    }
    
    @objc func pushOptionView() {
        let storyBoard = UIStoryboard(name: StoryBoard.main, bundle: nil)
        let optionListViewController = storyBoard.instantiateViewController(withIdentifier: "OptionListViewController")
        navigationController?.pushViewController(optionListViewController, animated: true)
    }
}
