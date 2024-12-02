//
//  WishCalendarWorker.swift
//  mdklychkovPW2
//
//  Created by Maksim Klychkov on 03.12.2024.
//

import Foundation

final class WishCalendarWorker {  
    // MARK: Public funcs
    public func fetchWishEvents() -> [WishEvent] {
        return CoreDataManager.shared.fetchWishEvents() ?? []
    }
}
