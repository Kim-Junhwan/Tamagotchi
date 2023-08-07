//
//  Alertable.swift
//  Tamagotchi
//
//  Created by JunHwan Kim on 2023/08/07.
//

import Foundation
import UIKit

protocol Alertable {}

extension Alertable where Self: UIViewController {
    func showAlert(title: String = "", message: String, cancelActionTitle: String, defaultActionBlock: UIAlertAction) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let cancelAction = UIAlertAction(title: cancelActionTitle, style: .cancel)
        alert.addAction(cancelAction)
        alert.addAction(defaultActionBlock)
        self.present(alert, animated: true)
    }
}

