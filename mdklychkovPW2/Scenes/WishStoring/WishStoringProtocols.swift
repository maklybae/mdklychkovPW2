//
//  WishStoringProtocols.swift
//  mdklychkovPW2
//
//  Created by Maksim Klychkov on 03.11.2024.
//

// MARK: - BuisnessLogic protocol
protocol WishStoringBuisnessLogic {
    func addWish(_ request: WishStoring.AddWish.Request)
    func fetchWishes(_ request: WishStoring.FetchWishes.Request)
}

// MARK: - PresentationLogic protocol
protocol WishStoringPresentaionLogic {
    func presentFetchedWishes(_ response: WishStoring.FetchWishes.Response)
    
    func routeTo()
}
