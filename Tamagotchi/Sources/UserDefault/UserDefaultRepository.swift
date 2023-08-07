//
//  UserDefaultRepository.swift
//  Tamagotchi
//
//  Created by JunHwan Kim on 2023/08/06.
//

import Foundation

struct UserDefaultRepository {
    @UserDefault(key: Flow.startBranchCondition, defaultValue: false)
    static var isLaunched: Bool
    
    @UserDefault(key: UserDefaultKey.selectedTamagotchi, defaultValue: "")
    static var selectedTama: String
    
    @UserDefault(key: UserDefaultKey.exp, defaultValue: 0.0)
    static var exp: Double
    
    @UserDefault(key: UserDefaultKey.eatRiceCount, defaultValue: 0)
    static var eatRiceCount: Int
    
    @UserDefault(key: UserDefaultKey.eatWaterDropCount, defaultValue: 0)
    static var eatWaterDropCount: Int
    
    @UserDefault(key: UserDefaultKey.userName, defaultValue: "")
    static var userName: String
}
