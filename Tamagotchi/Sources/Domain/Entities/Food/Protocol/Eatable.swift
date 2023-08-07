//
//  Eatable.swift
//  Tamagotchi
//
//  Created by JunHwan Kim on 2023/08/04.
//

protocol Eatable {
    var exp: Exp { get }
    
    func checkCanEat(num: Int) -> Bool
    func eaten(num: Int)
}
