//
//  WishStoringProtocols.swift
//  mdklychkovPW2
//
//  Created by Maksim Klychkov on 03.11.2024.
//

// MARK: - BuisnessLogic protocol
protocol WishCalendarBuisnessLogic {
    func fetchWishEvents(_ request: WishCalendar.FetchWishEvents.Request)
}

// MARK: - PresentationLogic protocol
protocol WishCalendarPresentaionLogic {
    func presentFetchedWishEvents(_ response: WishCalendar.FetchWishEvents.Response)
}
