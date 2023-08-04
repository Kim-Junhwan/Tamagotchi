//
//  DefaultFont.swift
//  Tamagotchi
//
//  Created by JunHwan Kim on 2023/08/04.
//

import Foundation
import UIKit

enum DefaultFont {
    case big
    case medium
    case small
    
    var font: UIFont {
        switch self {
        case .big:
            return UIFont.systemFont(ofSize: 15.0)
        case .medium:
            return UIFont.systemFont(ofSize: 14.0)
        case .small:
            return UIFont.systemFont(ofSize: 13.0)
        }
    }
}
