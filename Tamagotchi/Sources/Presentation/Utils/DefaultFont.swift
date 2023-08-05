//
//  DefaultFont.swift
//  Tamagotchi
//
//  Created by JunHwan Kim on 2023/08/04.
//

import Foundation
import UIKit

enum DefaultFont {
    
    case system
    case bold
    
    enum Size: Double {
        case big
        case medium
        case small
        
        var size: Double {
            switch self {
            case .big:
                return 15.0
            case .medium:
                return 14.0
            case .small:
                return 13.0
            }
        }
    }
    
    func font(size: Size) -> UIFont {
        switch self {
        case .system:
            return UIFont.systemFont(ofSize: size.size)
        case .bold:
            return UIFont.boldSystemFont(ofSize: size.size)
        }
    }
}
