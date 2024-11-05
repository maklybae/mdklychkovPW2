//
//  WishStoringInteractor.swift
//  mdklychkovPW2
//
//  Created by Maksim Klychkov on 03.11.2024.
//

import Foundation


final class WishStoringInteractor: WishStoringBuisnessLogic {
    private let presenter: WishStoringPresentaionLogic
    private let worker = WishStoringWorker()
    
    init(presenter: WishStoringPresentaionLogic) {
        self.presenter = presenter
    }
    
    func addWish(_ request: WishStoring.AddWish.Request) {
        let wish = Wish(text: request.text, date: Date.now)
        worker.appendWish(wish)
        let wishes = worker.fetchWishes()
        presenter.presentAddedWish(.init(wishes: wishes))
    }
    
    func deleteWish(_ request: WishStoring.DeleteWish.Request) {
        worker.deleteWish(atIndex: request.index)
        let wishes = worker.fetchWishes()
        presenter.presentDeletedWish(.init(wishes: wishes))
    }
    
    func fetchWishes(_ request: WishStoring.FetchWishes.Request) {
        let wishes = worker.fetchWishes()
        presenter.presentFetchedWishes(.init(wishes: wishes))
    }
}
