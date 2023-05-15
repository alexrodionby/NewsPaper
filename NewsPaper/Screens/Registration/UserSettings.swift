//
//  UserSettings.swift
//  NewsPaper
//
//  Created by Marat Guseynov on 11.05.2023.
//

import Foundation

final class UserSettings {
    
    private enum SettingKeys: String {
        case userName
    }
    
    static var userName: String! {
        get {
            return UserDefaults.standard.string(forKey: SettingKeys.userName.rawValue)
        } set {
            let defaults = UserDefaults.standard
            let key = SettingKeys.userName.rawValue
            
            if let name = newValue {
                print ("value: \(name) was added to key \(key)")
                defaults.set(name, forKey: key)
            } else {
                defaults.removeObject (forKey: key)
            }
        }
    }
}
