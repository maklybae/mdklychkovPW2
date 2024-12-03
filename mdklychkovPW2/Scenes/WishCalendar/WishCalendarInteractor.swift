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
    private let calendarManager = CalendarManager()
    private let worker = WishCalendarWorker()
    
    init(presenter: WishCalendarPresentaionLogic) {
        self.presenter = presenter
    }
    
    // MARK: - Use Case: Fetch WishEvents
    func fetchWishEvents(_ request: WishCalendar.FetchWishEvents.Request) {
        let wishEvents = worker.fetchWishEvents()
        presenter.presentFetchedWishEvents(WishCalendar.FetchWishEvents.Response(wishEvents: wishEvents))
    }
    
    // MARK: - Use Case: Add WishEvent to Calendar
    func addWishEventToCalendar(_ request: WishCalendar.AddWishEventToCalendar.Request) {
        if let wishEvent = worker.fetchWishEvent(byIndex: request.wishEventIndex) {
            let success = calendarManager.create(eventModel: CalendarEventModel(
                title: wishEvent.title ?? "",
                startDate: wishEvent.startDate ?? Date(),
                endDate: wishEvent.endDate ?? Date()))
            presenter.presentAddWishEventToCalendar(WishCalendar.AddWishEventToCalendar.Response(success: success))
        } else {
            presenter.presentAddWishEventToCalendar(WishCalendar.AddWishEventToCalendar.Response(success: false))
        }
    }
    
    // MARK: - Route to AddWishEvent
    func routeToAddWishEvent(_ request: WishCalendar.RouteToAddWishEvent.Request) {
        presenter.routeToAddWishEvent(WishCalendar.RouteToAddWishEvent.Response(
            navigationController: request.navigationController,
            backgroundColor: request.backgroundColor))
    }
    
}
