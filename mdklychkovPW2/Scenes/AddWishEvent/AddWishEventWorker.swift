//
//  AddWishEventWorker.swift
//  mdklychkovPW2
//
//  Created by Maksim Klychkov on 03.12.2024.
//

import Foundation

final class AddWishEventWorker {
    // MARK: Public funcs
    public func addWishEvent(title: String, note: String?, startDate: Date?, endDate: Date?) {
        CoreDataManager.shared.createWishEvent(title: title, note: note, startDate: startDate, endDate: endDate)
    }
}
