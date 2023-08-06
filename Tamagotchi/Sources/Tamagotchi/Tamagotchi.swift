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
