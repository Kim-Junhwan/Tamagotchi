//
//  WaterDrop.swift
//  Tamagotchi
//
//  Created by JunHwan Kim on 2023/08/05.
//

struct WaterDrop: Eatable {
    
    var exp: Exp = Exp(value: 0.5)
    
    init() {}
    
    private init(exp: Exp) {
        self.exp = exp
    }
    
    static func eatingSeveral(num: Int) -> WaterDrop {
        return WaterDrop(exp: num * WaterDrop().exp)
    }
    
    func eaten(num: Int) {
        UserDefaultRepository.eatWaterDropCount += num
    }
    
    func checkCanEat(num: Int) -> Bool {
        if num >= 50 {
            return false
        }
        return true
    }
}
