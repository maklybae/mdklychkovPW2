//
//  WishStoringPresenter.swift
//  mdklychkovPW2
//
//  Created by Maksim Klychkov on 03.11.2024.
//

import Foundation

final class WishCalendarPresenter: WishCalendarPresentaionLogic {
    // MARK: - Variables
    weak var view: WishCalendarViewController?
        
    // MARK: - Public funcs
    func presentFetchedWishEvents(_ response: WishCalendar.FetchWishEvents.Response) {
        let displayedWishEvents = convertToDisplayedWishEvents(response.wishEvents)
        view?.presentFetchedWishEvents(WishCalendar.FetchWishEvents.ViewModel(displayedWishEvents: displayedWishEvents))
    }
    
    func routeToAddWishEvent(_ response: WishCalendar.RouteToAddWishEvent.Response) {
        response.navigationController?.pushViewController(AddWishEventAssembly.build(withColor: response.backgroundColor), animated: true)
    }
    
    // MARK: - Private funcs
    private func convertToDisplayedWishEvents(_ wishEvents: [WishEvent]) -> [WishCalendar.DisplayedWishEvent] {
        var displayedWishEvents: [WishCalendar.DisplayedWishEvent] = []
        for wishEvent in wishEvents {
            let displayedWishEvent = WishCalendar.DisplayedWishEvent(
                title: wishEvent.title ?? "",
                note: wishEvent.note ?? "",
                startDate: wishEvent.startDate ?? Date(),
                endDate: wishEvent.endDate ?? Date())
            displayedWishEvents.append(displayedWishEvent)
        }
        return displayedWishEvents
    }
    
}
