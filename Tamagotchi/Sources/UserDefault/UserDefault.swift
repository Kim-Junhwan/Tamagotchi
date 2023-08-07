//
//  UserDefault.swift
//  Tamagotchi
//
//  Created by JunHwan Kim on 2023/08/06.
//

import Foundation

@propertyWrapper
struct UserDefault<T> {
    
    let key: String
    let defaultValue: T
    
    var wrappedValue: T {
        get {
            return UserDefaults.standard.object(forKey: self.key) as? T ?? self.defaultValue
        }
        
        set {
            UserDefaults.standard.set(newValue, forKey: self.key)
        }
    }
    
}
