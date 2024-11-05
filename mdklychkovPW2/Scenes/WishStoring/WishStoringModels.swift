//
//  WishStoringModels.swift
//  mdklychkovPW2
//
//  Created by Maksim Klychkov on 03.11.2024.
//

import UIKit

enum WishStoring {
    // MARK: - DisplayedWish model
    struct DisplayedWish: Equatable {
        var text: String
        var date: Date
    }
    
    // MARK: - Use Cases
    // MARK: - Add wish
    enum AddWish {
        struct Request {
            var text: String
        }
        struct Response {
            var wishes: [Wish]
        }
        struct ViewModel {
            var displayedWishes: [DisplayedWish]
        }
    }
    
    // MARK: - Fetch wishes
    enum FetchWishes {
        struct Request {}
        struct Response {
            var wishes: [Wish]
        }
        struct ViewModel {
            var displayedWishes: [DisplayedWish]
        }
    }
    
    // MARK: - Delete wish
    enum DeleteWish {
        struct Request {
            var index: Int
        }
        struct Response {
            var wishes: [Wish]
        }
        struct ViewModel {
            var displayedWishes: [DisplayedWish]
        }
    }
}
