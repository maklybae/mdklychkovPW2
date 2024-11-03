//
//  WishStoringPresenter.swift
//  mdklychkovPW2
//
//  Created by Maksim Klychkov on 03.11.2024.
//

import Foundation

final class WishStoringPresenter: WishStoringPresentaionLogic {
    weak var view: WishStoringViewController?
    
    func presentFetchedWishes(_ response: WishStoring.FetchWishes.Response) {
        var displayedWishes = [WishStoring.FetchWishes.ViewModel.DisplayedWish]()
        for wish in response.wishes {
            let displayedWish = WishStoring.FetchWishes.ViewModel.DisplayedWish(text: wish.text)
            displayedWishes.append(displayedWish)
        }
        view?.displayFetchedWish(WishStoring.FetchWishes.ViewModel(displayedWishes: displayedWishes))
    }
    
    func routeTo() {
        
    }
    
}
