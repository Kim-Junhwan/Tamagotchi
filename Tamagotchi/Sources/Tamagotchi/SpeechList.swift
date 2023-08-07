//
//  SpeechList.swift
//  Tamagotchi
//
//  Created by JunHwan Kim on 2023/08/07.
//

import Foundation

struct SpeechList {
    let userName: String
    
    private lazy var speechList: [String] = ["\(userName)님 반가워요", "고양이를 좋아하시나요 \(userName)님?","오늘 하루도 힘내세요 \(userName)님","\(userName)님은 어떤걸 좋아하시나요?","\(userName)님\(userName)님\(userName)님\(userName)님\(userName)님","오늘 하루도 수고많았습니다 \(userName)님","\(userName)님 행복한 하루 되세요"]
    
    var currentSpeech: String {
        mutating get {
            speechList.randomElement() ?? "반가워요 \(userName)님"
        }
    }
    
    init(userName: String) {
        self.userName = userName
    }
}
