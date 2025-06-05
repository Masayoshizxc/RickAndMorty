//
//  UserDefaults.swift
//  RickAndMorty
//
//  Created by Adilet on 3/6/25.
//

import UIKit
import Foundation

class UserDefaultsService {
    
    enum Keys: String {
        case savedRedirectLink
    }
    
    
    private let storage: UserDefaults
    static let shared = UserDefaultsService()
    
    required init(storage: UserDefaults = UserDefaults.standard) {
        self.storage = storage
    }
    
    func saveRedirectLink(link: String) {
        storage.setValue(link, forKey: Keys.savedRedirectLink.rawValue)
    }
    
    func getSavedLink() -> String? {
        return storage.string(forKey: Keys.savedRedirectLink.rawValue)
    }
    
}


