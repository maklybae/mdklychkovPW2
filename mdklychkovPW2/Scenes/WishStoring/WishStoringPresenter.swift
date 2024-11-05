//
//  WishStoringPresenter.swift
//  mdklychkovPW2
//
//  Created by Maksim Klychkov on 03.11.2024.
//

import Foundation

final class WishStoringPresenter: WishStoringPresentaionLogic {
    weak var view: WishStoringViewController?
    
    private func convertToDisplayedWishes(_ wishes: [Wish]) -> [WishStoring.DisplayedWish] {
        var displayedWishes = [WishStoring.DisplayedWish]()
        for wish in wishes {
            let displayedWish = WishStoring.DisplayedWish(text: wish.text, date: wish.date)
            displayedWishes.append(displayedWish)
        }
        return displayedWishes
    }
    
    func presentFetchedWishes(_ response: WishStoring.FetchWishes.Response) {
        let displayedWishes = convertToDisplayedWishes(response.wishes)
        view?.displayFetchedWish(WishStoring.FetchWishes.ViewModel(displayedWishes: displayedWishes))
    }
    
    func presentAddedWish(_ response: WishStoring.AddWish.Response) {
        let displayedWishes = convertToDisplayedWishes(response.wishes)
        view?.displayAddedWish(WishStoring.AddWish.ViewModel(displayedWishes: displayedWishes))
    }
    
    func presentDeletedWish(_ response: WishStoring.DeleteWish.Response) {
        let displayedWishes = convertToDisplayedWishes(response.wishes)
        view?.displayDeletedWish(WishStoring.DeleteWish.ViewModel(displayedWishes: displayedWishes))
    }
}
