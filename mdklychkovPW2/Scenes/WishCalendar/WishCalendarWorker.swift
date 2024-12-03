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
    
    public func fetchWishEvent(byIndex index: Int) -> WishEvent? {
        let wishEvent = CoreDataManager.shared.fetchWishEvent(byIndex: index)
        return wishEvent
    }
}
