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
//    private let worker = WishStoringWorker()
    
    init(presenter: WishCalendarPresentaionLogic) {
        self.presenter = presenter
    }
//    
//    // MARK: - Use Case: Add wish
//    func addWish(_ request: WishStoring.AddWish.Request) {
//        let wish = Wish(text: request.text, date: Date.now)
//        worker.appendWish(wish)
//        let wishes = worker.fetchWishes()
//        presenter.presentAddedWish(.init(wishes: wishes))
//    }
//    
//    // MARK: - Delete wish
//    func deleteWish(_ request: WishStoring.DeleteWish.Request) {
//        worker.deleteWish(atIndex: request.index)
//        let wishes = worker.fetchWishes()
//        presenter.presentDeletedWish(.init(wishes: wishes))
//    }
//    
//    // MARK: - Edit wish
//    func editWish(_ request: WishStoring.EditWish.Request) {
//        guard let wish = worker.getWish(atIndex: request.index) else { return }
//        worker.deleteWish(atIndex: request.index)
//        let wishes = worker.fetchWishes()
//        presenter.presentEditedWish(.init(wishes: wishes, editedWishText: wish.text))
//    }
//    
//    // MARK: - Fetch wishes
//    func fetchWishes(_ request: WishStoring.FetchWishes.Request) {
//        let wishes = worker.fetchWishes()
//        presenter.presentFetchedWishes(.init(wishes: wishes))
//    }
}
