//
//  WishStoringWorker.swift
//  mdklychkovPW2
//
//  Created by Maksim Klychkov on 03.11.2024.
//

import Foundation

class WishStoringWorker {
    // MARK: - Constants
    private enum Constants {
        static let wishesKey = "wishes"
    }
    
    // MARK: Public funcs
    func fetchWishes() -> [Wish] {
        guard let savedWishesData = UserDefaults.standard.data(forKey: Constants.wishesKey) else {
            return []
        }
        
        let savedWishes = (try? JSONDecoder().decode([Wish].self, from: savedWishesData)) ?? []
        return savedWishes
    }
    
    func appendWish(_ wish: Wish) {
        var savedWishes = (try? JSONDecoder().decode([Wish].self, from: UserDefaults.standard.data(forKey: Constants.wishesKey) ?? Data())) ?? []
        
        savedWishes.append(wish)
        
        if let encodedWishes = try? JSONEncoder().encode(savedWishes) {
            UserDefaults.standard.set(encodedWishes, forKey: Constants.wishesKey)
        }
    }
    
    func deleteWish(atIndex index: Int) {
        guard let savedWishesData = UserDefaults.standard.data(forKey: Constants.wishesKey) else {
            return
        }
        guard var savedWishes = try? JSONDecoder().decode([Wish].self, from: savedWishesData) else {
            return
        }
        
        savedWishes.remove(at: index)
        
        if let encodedWishes = try? JSONEncoder().encode(savedWishes) {
            UserDefaults.standard.set(encodedWishes, forKey: Constants.wishesKey)
        }
    }
}
