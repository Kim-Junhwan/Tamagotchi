//
//  Tamagotchi.swift
//  Tamagotchi
//
//  Created by JunHwan Kim on 2023/08/05.
//

import UIKit

enum Tamagotchi {
    case twinkle
    case sting
    case happy
    case empty
    
    private func getSafeImage(imageNamed: String) -> UIImage {
        guard let image = UIImage(named: imageNamed) else { return UIImage() }
        return image
    }
    
    var image: UIImage {
        let defaultImage: UIImage
        switch self {
        case .twinkle:
            defaultImage = getSafeImage(imageNamed: "3-6")
        case .sting:
            defaultImage = getSafeImage(imageNamed: "1-6")
        case .happy:
            defaultImage = getSafeImage(imageNamed: "2-6")
        case .empty:
            defaultImage = getSafeImage(imageNamed: "noImage")
        }
        return defaultImage
    }
    
    var name: String {
        switch self {
        case .twinkle:
            return "반짝반짝 다마고치"
        case .sting:
            return "따끔따끔 다마고치"
        case .happy:
            return "방실방실 다마고치"
        case .empty:
            return "준비중이에요"
        }
    }
}
