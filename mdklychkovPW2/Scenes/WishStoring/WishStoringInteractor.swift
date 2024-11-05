//
//  WishStoringInteractor.swift
//  mdklychkovPW2
//
//  Created by Maksim Klychkov on 03.11.2024.
//

import Foundation


final class WishStoringInteractor: WishStoringBuisnessLogic {
    // MARK: - Variables
    private let presenter: WishStoringPresentaionLogic
    private let worker = WishStoringWorker()
    
    init(presenter: WishStoringPresentaionLogic) {
        self.presenter = presenter
    }
    
    // MARK: - Use Case: Add wish
    func addWish(_ request: WishStoring.AddWish.Request) {
        let wish = Wish(text: request.text, date: Date.now)
        worker.appendWish(wish)
        let wishes = worker.fetchWishes()
        presenter.presentAddedWish(.init(wishes: wishes))
    }
    
    // MARK: - Delete wish
    func deleteWish(_ request: WishStoring.DeleteWish.Request) {
        worker.deleteWish(atIndex: request.index)
        let wishes = worker.fetchWishes()
        presenter.presentDeletedWish(.init(wishes: wishes))
    }
    
    // MARK: - Fetch wishes
    func fetchWishes(_ request: WishStoring.FetchWishes.Request) {
        let wishes = worker.fetchWishes()
        presenter.presentFetchedWishes(.init(wishes: wishes))
    }
}
