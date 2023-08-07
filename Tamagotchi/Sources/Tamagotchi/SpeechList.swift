//
//  SpeechList.swift
//  Tamagotchi
//
//  Created by JunHwan Kim on 2023/08/07.
//

import Foundation

struct SpeechList {
    let userName: String
    private var speechList: [String] = ["반갑습니다.", "고양이","강아지","기린","토끼","거북이","햄스터"]
    
    init(userName: String) {
        self.userName = userName
    }
    
    func getRandomSpeech() -> String {
        guard let speech = speechList.randomElement() else { return "" }
        return speech
    }
}
