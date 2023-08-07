//
//  Tamagotchi.swift
//  Tamagotchi
//
//  Created by JunHwan Kim on 2023/08/04.
//

import UIKit

protocol TamagotchiController: Feeding {
    var currentTamagotchi: Tamagotchi { get }
    var level: Level { get }
    var tamagotchiImage: UIImage { get }
    var tamagotchiName: String { get }
    var eatRiceCount: Int { get set }
    var eatWaterDropCount: Int { get set }
    var currentSpeech: String { get }
}

class DefaultTamagotchiController: TamagotchiController {
    
    let speechList = SpeechList(userName: UserDefaultRepository.userName)
    lazy var currentSpeech: String = speechList.getRandomSpeech()
    
    var eatRiceCount: Int {
        get {
            return UserDefaultRepository.eatRiceCount
        }
        set {
            UserDefaultRepository.eatRiceCount = newValue
        }
    }
    
    var eatWaterDropCount: Int {
        get {
            return UserDefaultRepository.eatWaterDropCount
        }
        
        set {
            UserDefaultRepository.eatRiceCount = newValue
        }
    }
    
    var currentTamagotchi: Tamagotchi {
        get {
            return Tamagotchi(rawValue: UserDefaultRepository.selectedTama) ?? .empty
        }
    }
    
    var tamagotchiImage: UIImage {
        get {
            currentTamagotchi.getLevelImage(level: level)
        }
    }
    
    var tamagotchiName: String {
        get {
            currentTamagotchi.name
        }
    }
    
    var exp: Exp {
        get {
            return Exp(value: UserDefaultRepository.exp)
        }
        set {
            UserDefaultRepository.exp = newValue.value
        }
    }
    
    var oldLevel: Level = {
        return Level(exp: Exp(value: UserDefaultRepository.exp))
    }()
    
    var level: Level {
        get {
            let newLevel = Level(exp: exp)
            if oldLevel.value < newLevel.value {
                currentSpeech = "덕분에 레벨 업 했어요"
            }
            oldLevel = newLevel
            return newLevel
        }
    }
    
    init() {
        self.exp = Exp(value: UserDefaultRepository.exp)
    }
    
    func feed(_ food: Eatable, num: Int) {
        if !food.checkCanEat(num: num) {
            currentSpeech = "한꺼번에 이렇게 많이 먹을 수 없어요!"
            return
        }
        currentSpeech = speechList.getRandomSpeech()
        food.eaten(num: num)
        exp = exp + num * food.exp
    }
}
