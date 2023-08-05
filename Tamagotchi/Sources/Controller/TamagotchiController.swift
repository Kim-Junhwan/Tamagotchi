//
//  Tamagotchi.swift
//  Tamagotchi
//
//  Created by JunHwan Kim on 2023/08/04.
//

protocol TamagotchiController: Feeding {
    var currentTamagotchi: Tamagotchi { get set }
    var level: Level { get }
}

class DefaultTamagotchiController: TamagotchiController {
    
    var currentTamagotchi: Tamagotchi
    
    var exp: Exp
    
    var level: Level {
        get {
            return Level(exp: exp)
        }
    }
    
    init(exp: Exp = Exp(value: .zero), tamagotchi: Tamagotchi) {
        self.exp = exp
        currentTamagotchi = tamagotchi
    }
    
    func feed(_ food: Eatable) {
        exp += food.exp
    }
}
