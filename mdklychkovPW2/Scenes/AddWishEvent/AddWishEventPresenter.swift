//
//  AddWishEventPresenter.swift
//  mdklychkovPW2
//
//  Created by Maksim Klychkov on 03.12.2024.
//

import Foundation

final class AddWishEventPresenter: AddWishEventPresentaionLogic {
    // MARK: - Variables
    weak var view: AddWishEventViewController?
    
    func presentAddWishEvent(_ response: AddWishEvent.AddWishEvent.Response) {
        response.navigationController?.popViewController(animated: true)
    }
}
