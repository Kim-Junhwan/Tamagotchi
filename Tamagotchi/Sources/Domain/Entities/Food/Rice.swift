//
//  Rice.swift
//  Tamagotchi
//
//  Created by JunHwan Kim on 2023/08/04.
//

struct Rice: Eatable {
    
    var exp: Exp = Exp(value: 0.2)
    
    init() {}
    
    private init(exp: Exp) {
        self.exp = exp
    }
    
    static func eatingSeveral(num: Int) -> Rice {
        return Rice(exp: num * Rice().exp)
    }
    
    func eaten(num: Int) {
        UserDefaultRepository.eatRiceCount += num
    }
    
    func checkCanEat(num: Int) -> Bool {
        if num >= 100 {
            return false
        }
        return true
    }
}
