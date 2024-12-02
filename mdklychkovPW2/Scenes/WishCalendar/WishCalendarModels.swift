//
//  WishStoringModels.swift
//  mdklychkovPW2
//
//  Created by Maksim Klychkov on 03.11.2024.
//

import UIKit

enum WishCalendar {
    // MARK: - DisplayedWishEvents model
    struct DisplayedWishEvent: Equatable {
        var title: String
        var note: String
        var startDate: Date
        let endDate: Date
    }
    
    // MARK: - Use Cases
    // MARK: - Fetch WishEvents
    enum FetchWishEvents {
        struct Request {
        }
        struct Response {
            var wishEvents: [WishEvent]
        }
        struct ViewModel {
            var displayedWishEvents: [DisplayedWishEvent]
        }
    }
//    
//    // MARK: - Fetch wishes
//    enum FetchWishes {
//        struct Request {}
//        struct Response {
//            var wishes: [Wish]
//        }
//        struct ViewModel {
//            var displayedWishes: [DisplayedWish]
//        }
//    }
//    
//    // MARK: - Delete wish
//    enum DeleteWish {
//        struct Request {
//            var index: Int
//        }
//        struct Response {
//            var wishes: [Wish]
//        }
//        struct ViewModel {
//            var displayedWishes: [DisplayedWish]
//        }
//    }
//    
//    // MARK: - Edit wish
//    enum EditWish {
//        struct Request {
//            var index: Int
//        }
//        struct Response {
//            var wishes: [Wish]
//            var editedWishText: String
//        }
//        struct ViewModel {
//            var displayedWishes: [DisplayedWish]
//            var editedWishText: String
//        }
//    }
}
