//
//  WishStoringModels.swift
//  mdklychkovPW2
//
//  Created by Maksim Klychkov on 03.11.2024.
//

import UIKit

enum WishStoring {
    struct DisplayedWish: Equatable {
        var text: String
        var date: Date
    }
    
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
    
    enum FetchWishes {
        struct Request {}
        struct Response {
            var wishes: [Wish]
        }
        struct ViewModel {
            var displayedWishes: [DisplayedWish]
        }
    }
    
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
