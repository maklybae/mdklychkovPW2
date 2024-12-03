//
//  WishStoringInteractor.swift
//  mdklychkovPW2
//
//  Created by Maksim Klychkov on 03.11.2024.
//

import Foundation

final class WishCalendarInteractor: WishCalendarBuisnessLogic {
    // MARK: - Variables
    private let presenter: WishCalendarPresentaionLogic
    private let worker = WishCalendarWorker()
    
    init(presenter: WishCalendarPresentaionLogic) {
        self.presenter = presenter
    }
    
    // MARK: - Use Case: Fetch WishEvents
    func fetchWishEvents(_ request: WishCalendar.FetchWishEvents.Request) {
        let wishEvents = worker.fetchWishEvents()
        presenter.presentFetchedWishEvents(WishCalendar.FetchWishEvents.Response(wishEvents: wishEvents))
    }
    
    // MARK: - Route to AddWishEvent
    func routeToAddWishEvent(_ request: WishCalendar.RouteToAddWishEvent.Request) {
        presenter.routeToAddWishEvent(WishCalendar.RouteToAddWishEvent.Response(
            navigationController: request.navigationController,
            backgroundColor: request.backgroundColor))
    }
}
