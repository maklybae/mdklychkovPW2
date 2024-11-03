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
        guard let savedWishesData = UserDefaults.standard.data(forKey: Constants.wishesKey) else {
            return []
        }
        
        let wishes = (try? JSONDecoder().decode([Wish].self, from: savedWishesData)) ?? []
        return wishes
    }
    
    func appendWish(_ wish: Wish) {
        var savedWishes = (try? JSONDecoder().decode([Wish].self, from: UserDefaults.standard.data(forKey: Constants.wishesKey) ?? Data())) ?? []
        
        savedWishes.append(wish)
        
        // Encode and save the updated array back to UserDefaults
        if let encodedWishes = try? JSONEncoder().encode(savedWishes) {
            UserDefaults.standard.set(encodedWishes, forKey: Constants.wishesKey)
        }
    }
}