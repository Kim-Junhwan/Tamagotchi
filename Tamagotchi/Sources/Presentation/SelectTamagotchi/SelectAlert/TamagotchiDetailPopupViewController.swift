//
//  AlertViewController.swift
//  Tamagotchi
//
//  Created by JunHwan Kim on 2023/08/05.
//

import UIKit

class TamagotchiDetailPopupViewController: UIViewController {
    
    private enum Setence {
        static let cancelButtonTitle: String = "취소"
        static let startButtonTitle: String = "시작하기"
    }
    
    private enum Metric {
        static let alertViewCornerRadius: Double = 10.0
        static let cancelButtonBackgroundAlpha: Double = 0.1
    }
    
    @IBOutlet weak var alertView: UIStackView!
    @IBOutlet weak var tamagotchiProfileView: TamagotchiProfileView!
    @IBOutlet weak var discussionLabel: UILabel!
    @IBOutlet weak var cancelButton: UIButton!
    @IBOutlet weak var startButton: UIButton!
    @IBOutlet weak var buttonStackView: UIStackView!
    var selectTamagotchi: Tamagotchi = .empty

    override func viewDidLoad() {
        super.viewDidLoad()
        tamagotchiProfileView.tamagotchImageView.image = selectTamagotchi.image
        tamagotchiProfileView.nameLabel.text = selectTamagotchi.name
        discussionLabel.text = selectTamagotchi.discussion
        layout()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        alertView.layoutIfNeeded()
        drawButtonStackViewTopBorder()
    }
    
    private func layout() {
        cancelButtonLayout()
        startButtonLayout()
        viewLayout()
        discussionLabelLayout()
    }
    
    private func viewLayout() {
        alertView.layer.cornerRadius = Metric.alertViewCornerRadius
    }
    
    private func discussionLabelLayout() {
        discussionLabel.textColor = DefaultColor.defualtFontColor
        discussionLabel.font = DefaultFont.system.font(size: .medium)
    }
    
    private func drawButtonStackViewTopBorder() {
        let border = CALayer()
        let width = buttonStackView.bounds.width
        let height = 0.5
        border.frame = CGRect(x: 0, y: 0, width: width, height: height)
        border.backgroundColor = DefaultColor.defualtFontColor.cgColor
        buttonStackView.layer.addSublayer(border)
    }
    
    private func cancelButtonLayout() {
        guard let cancelBackgroundColor = UIColor.black.cgColor.copy(alpha: Metric.cancelButtonBackgroundAlpha) else { return }
        let cancelButtonCongfiguration = UIButton.makeDefaultButtonConfiguration(backgroundColor: UIColor(cgColor: cancelBackgroundColor), font: DefaultFont.system.font(size: .medium), textColor: DefaultColor.defualtFontColor, title: Setence.cancelButtonTitle, cornerRadius: .zero)
        cancelButton.configuration = cancelButtonCongfiguration
    }
    
    private func startButtonLayout() {
        let startButtonCongfiguration = UIButton.makeDefaultButtonConfiguration(backgroundColor: .clear, font: DefaultFont.system.font(size: .medium), textColor: DefaultColor.defualtFontColor, title: Setence.startButtonTitle, cornerRadius: .zero)
        startButton.configuration = startButtonCongfiguration
    }
    
    @IBAction func tapCancelButton(_ sender: UIButton) {
        dismiss(animated: true)
    }
}
