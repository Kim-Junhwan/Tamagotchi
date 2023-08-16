//
//  EatUseCase.swift
//  Tamagotchi
//
//  Created by JunHwan Kim on 2023/08/04.
//

enum FeedingError: Error {
    case toomuchFeed
}

protocol Feeding {
    func feed(_ food: Eatable, num: Int) throws
}
