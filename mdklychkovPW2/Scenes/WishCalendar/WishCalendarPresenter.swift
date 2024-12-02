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
    
//    func presentFetchedWishes(_ response: WishStoring.FetchWishes.Response) {
//        let displayedWishes = convertToDisplayedWishes(response.wishes)
//        view?.displayFetchedWish(WishStoring.FetchWishes.ViewModel(displayedWishes: displayedWishes))
//    }
//    
//    func presentAddedWish(_ response: WishStoring.AddWish.Response) {
//        let displayedWishes = convertToDisplayedWishes(response.wishes)
//        view?.displayAddedWish(WishStoring.AddWish.ViewModel(displayedWishes: displayedWishes))
//    }
//    
//    func presentDeletedWish(_ response: WishStoring.DeleteWish.Response) {
//        let displayedWishes = convertToDisplayedWishes(response.wishes)
//        view?.displayDeletedWish(WishStoring.DeleteWish.ViewModel(displayedWishes: displayedWishes))
//    }
//    
//    func presentEditedWish(_ response: WishStoring.EditWish.Response) {
//        let displayedWishes = convertToDisplayedWishes(response.wishes)
//        view?.displayEditedWish(WishStoring.EditWish.ViewModel(displayedWishes: displayedWishes, editedWishText: response.editedWishText))
//    }
    
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
