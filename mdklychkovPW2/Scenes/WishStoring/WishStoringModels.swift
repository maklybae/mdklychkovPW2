//
//  WishStoringModels.swift
//  mdklychkovPW2
//
//  Created by Maksim Klychkov on 03.11.2024.
//

import UIKit

enum WishStoring {
    enum AddWish {
        struct Request {
            var text: String
        }
    }
    
    enum FetchWishes {
        struct Request {}
        struct Response {
            var wishes: [Wish]
        }
        struct ViewModel {
            struct DisplayedWish {
                var text: String
            }
            var displayedWishes: [DisplayedWish]
        }
    }
}
