//
//  Tamagotchi.swift
//  Tamagotchi
//
//  Created by JunHwan Kim on 2023/08/05.
//

import UIKit

enum Tamagotchi: String {
    case twinkle = "반짝반짝 다마고치"
    case sting = "따끔따끔 다마고치"
    case happy = "방실방실 다마고치"
    case empty
    
    var discussion: String {
        switch self {
        case .twinkle:
            return "저는 반짝반짝 빛나는 다마고치입니당 키는 100km 몸무게는 150톤이에용 성격은 빠릅니다~! 열심히 잘 먹고 잘 클 자신은 있습니당 반짝반짝"
        case .sting:
            return "저는 선인장 다마고치입니다. 키는 2cm 몸무게는 150g 이에요. 성격은 소심하지만 마음은 따뜻해요. 열심히 잘 먹고 잘 클 자신은 있답니다. 반가워요 주인님!"
        case .happy:
            return "저는 방실방실 다마고치입니당 키는 100km 몸무게는 150톤이에용 성격은 화끈하고 날라다닙니당~! 열심히 잘 먹고 잘 클 자신은 있습니당 방실방실"
        case .empty:
            return ""
        }
    }
    
    private var imageName: String {
        switch self {
        case .twinkle:
            return "3-"
        case .sting:
            return "1-"
        case .happy:
            return "2-"
        case .empty:
            return "noImage"
        }
    }
    
    var defaultImage: UIImage {
        if self == .empty {
            return getSafeImage(imageNamed: self.imageName)
        }
        return getSafeImage(imageNamed: "\(self.imageName)6")
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
    
    private func getSafeImage(imageNamed: String) -> UIImage {
        guard let image = UIImage(named: imageNamed) else { return UIImage() }
        return image
    }
    
    func getLevelImage(level: Level) -> UIImage {
        if level.value == 10 {
            return getSafeImage(imageNamed: "\(imageName)9")
        }
        return getSafeImage(imageNamed: "\(imageName)\(level.value)")
    }
}
