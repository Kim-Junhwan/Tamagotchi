//
//  UIViewController+.swift
//  Tamagotchi
//
//  Created by JunHwan Kim on 2023/08/06.
//

import Foundation
import UIKit

extension UIViewController {
    func changeRootView(viewControllerIdentifier: String) {
        guard let scene = UIApplication.shared.connectedScenes.first?.delegate as? SceneDelegate else {return}
        let currentWindow = scene.window
        let storyBoard = UIStoryboard(name: StoryBoard.main, bundle: nil)
        let viewController = storyBoard.instantiateViewController(withIdentifier: viewControllerIdentifier)
        currentWindow?.rootViewController = viewController
        currentWindow?.makeKeyAndVisible()
    }
}
