//
//  Level.swift
//  Tamagotchi
//
//  Created by JunHwan Kim on 2023/08/04.
//

struct Level {
    private let _value: Exp
    
    var value: Int {
        get {
            return levelLogic(exp: _value)
        }
    }
    
    init(exp: Exp) {
        _value = exp
    }
    
    private func levelLogic(exp: Exp) -> Int {
        switch exp.value {
        case 0..<20 :
            return 1
        case 20..<30:
            return 2
        case 30..<40:
            return 3
        case 40..<50:
            return 4
        case 50..<60:
            return 5
        case 60..<70:
            return 6
        case 70..<80:
            return 7
        case 80..<90:
            return 8
        case 90..<100:
            return 9
        case 100...:
            return 10
        default:
            return 1
        }
    }
}
