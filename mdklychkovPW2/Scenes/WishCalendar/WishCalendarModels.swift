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
    
    // MARK: - Add WishEvent to Calendar
    enum AddWishEventToCalendar {
        struct Request {
            var wishEventIndex: Int
        }
        struct Response {
            var success: Bool
        }
    }

    enum RouteToAddWishEvent {
        struct Request {
            var navigationController: UINavigationController?
            var backgroundColor: UIColor
        }
        struct Response {
            var navigationController: UINavigationController?
            var backgroundColor: UIColor
        }
    }
}
