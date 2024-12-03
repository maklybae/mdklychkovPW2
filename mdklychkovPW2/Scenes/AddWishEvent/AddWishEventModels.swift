//
//  AddWishEventModels.swift
//  mdklychkovPW2
//
//  Created by Maksim Klychkov on 03.12.2024.
//

import Foundation
import UIKit

enum AddWishEvent {
    struct WishEventFromFields {
        var title: String
        var note: String
        var startDate: Date
        let endDate: Date
    }
    
    enum AddWishEvent {
        struct Request {
            var wishEventFromFields: WishEventFromFields
            var navigationController: UINavigationController?
        }
        struct Response {
            var navigationController: UINavigationController?
        }
    }
}
