//
//  Level.swift
//  Tamagotchi
//
//  Created by JunHwan Kim on 2023/08/04.
//

struct Level {
    let value: Int
    
    init(exp: Exp) {
        value = Int(exp.value)
    }
}
