//
//  WishStoringWorker.swift
//  mdklychkovPW2
//
//  Created by Maksim Klychkov on 03.11.2024.
//

import Foundation

class WishStoringWorker {
    private enum Constants {
        static let wishesKey = "wishes"
    }
    
    func fetchWishes() -> [Wish] {
        return UserDefaults.standard.array(forKey: Constants.wishesKey) as? [Wish] ?? []
    }
    
    func appendWish(_ wish: Wish) {
        guard var array = UserDefaults.standard.array(forKey: Constants.wishesKey) as? [Wish] else {
            return
        }
        array.append(wish)
    }
}
