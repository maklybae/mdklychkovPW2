//
//  AddWishEventProtocols.swift
//  mdklychkovPW2
//
//  Created by Maksim Klychkov on 03.12.2024.
//

import Foundation

// MARK: - BuisnessLogic protocol
protocol AddWishEventBuisnessLogic {
    func addWishEvent(_ request: AddWishEvent.AddWishEvent.Request)
}

// MARK: - PresentationLogic protocol
protocol AddWishEventPresentaionLogic {
    func presentAddWishEvent(_ response: AddWishEvent.AddWishEvent.Response)
}
