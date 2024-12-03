//
//  AddWishEventInteractor.swift
//  mdklychkovPW2
//
//  Created by Maksim Klychkov on 03.12.2024.
//

import Foundation

final class AddWishEventInteractor: AddWishEventBuisnessLogic {
    // MARK: - Variables
    private let presenter: AddWishEventPresentaionLogic
    private let worker = AddWishEventWorker()
    
    init(presenter: AddWishEventPresenter) {
        self.presenter = presenter
    }
    
    func addWishEvent(_ request: AddWishEvent.AddWishEvent.Request) {
        if request.wishEventFromFields.endDate > request.wishEventFromFields.startDate || request.wishEventFromFields.title.isEmpty {
            return
        }
        
        worker.addWishEvent(
            title: request.wishEventFromFields.title,
            note: request.wishEventFromFields.note,
            startDate: request.wishEventFromFields.startDate,
            endDate: request.wishEventFromFields.endDate
        )
        presenter.presentAddWishEvent(AddWishEvent.AddWishEvent.Response(navigationController: request.navigationController))
    }
}
