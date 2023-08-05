//
//  Exp.swift
//  Tamagotchi
//
//  Created by JunHwan Kim on 2023/08/04.
//

struct Exp {
    var value: Double
    
    static func + (lhs: Exp, rhs: Exp) -> Exp {
        return Exp(value: lhs.value + rhs.value)
    }
    
    static func += (lhs: inout Exp, rhs: Exp) {
        lhs.value = rhs.value
    }
    
    static func * (lhs: Int, rhs: Exp) -> Exp {
        return Exp(value: Double(lhs) * rhs.value)
    }
}
