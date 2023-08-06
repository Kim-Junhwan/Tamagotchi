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
    override func viewDidLoad() {
        super.viewDidLoad()
        layoutButton(button: feedRiceButton, title: "밥먹기", image: UIImage(systemName: "drop.circle"))
        layoutButton(button: feedWaterButton, title: "물먹기", image: UIImage(systemName: "leaf.circle"))
        layoutStatusLabelStackView(stackView: statusLabelStackView)
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
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        layoutTextField(textField: feedRiceTextField, placeHolder: "밥주세용")
        layoutTextField(textField: feedWaterTextField, placeHolder: "물주세용")
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
    }
    
}
