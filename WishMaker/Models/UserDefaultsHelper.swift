//
//  UserDefaultsHelper.swift
//  WishMaker
//
//  Created by Аскар Ахметьянов on 02.12.2024.
//

import Foundation

class UserDefaultsHelper {
    private let defaults = UserDefaults.standard

    func saveWishes(_ wishes: [String]) {
        defaults.set(wishes, forKey: Constants.wishesKey)
    }

    func loadWishes() -> [String] {
        return defaults.stringArray(forKey: Constants.wishesKey) ?? []
    }
}

