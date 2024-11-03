//
//  WishMakerModels.swift
//  mdklychkovPW2
//
//  Created by Maksim Klychkov on 30.10.2024.
//

import UIKit

// MARK: - Use Cases
enum WishMaker {
    enum ChangeBackgroundColor {
        struct Request {
            var red: Double
            var green: Double
            var blue: Double
        }
        struct Response {
            var red: Double
            var green: Double
            var blue: Double
            var alpha: Double
        }
        struct ViewModel {
            var uiColor: UIColor
        }
    }
    
    enum RandomizeBackgroundColor {
        struct Request { }
        struct Response {
            var red: Double
            var green: Double
            var blue: Double
            var alpha: Double
        }
        struct ViewModel {
            var uiColor: UIColor
        }
    }
    
    enum SetHexColor {
        struct Request {
            var hex: String
        }
        struct Response {
            var red: Double
            var green: Double
            var blue: Double
            var alpha: Double
        }
        struct ViewModel {
            var uiColor: UIColor
        }
    }
    
    enum RouteToWishStoring {
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
