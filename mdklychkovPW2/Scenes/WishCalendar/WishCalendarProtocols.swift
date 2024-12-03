//
//  WishStoringProtocols.swift
//  mdklychkovPW2
//
//  Created by Maksim Klychkov on 03.11.2024.
//

// MARK: - BuisnessLogic protocol
protocol WishCalendarBuisnessLogic {
    func fetchWishEvents(_ request: WishCalendar.FetchWishEvents.Request)
    func addWishEventToCalendar(_ request: WishCalendar.AddWishEventToCalendar.Request)
    
    func routeToAddWishEvent(_ request: WishCalendar.RouteToAddWishEvent.Request)
}

// MARK: - PresentationLogic protocol
protocol WishCalendarPresentaionLogic {
    func presentFetchedWishEvents(_ response: WishCalendar.FetchWishEvents.Response)
    func presentAddWishEventToCalendar(_ response: WishCalendar.AddWishEventToCalendar.Response)
    
    func routeToAddWishEvent(_ response: WishCalendar.RouteToAddWishEvent.Response)
}
