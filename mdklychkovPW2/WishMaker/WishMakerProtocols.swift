//
//  WishMakerProtocols.swift
//  mdklychkovPW2
//
//  Created by Maksim Klychkov on 30.10.2024.
//

// MARK: - BuisnessLogic protocol
protocol BuisnessLogic {
    func changeBackgroundColor(_ request: WishMaker.ChangeBackgroundColor.Request)
    func randomizeBackgroundColor(_ request: WishMaker.RandomizeBackgroundColor.Request)
}

// MARK: - PresentationLogic protocol
protocol PresentaionLogic {
    func presentChangedBackgroundColor(_ response: WishMaker.ChangeBackgroundColor.Response)
    func presentRandomizedBackgroundColor(_ response: WishMaker.RandomizeBackgroundColor.Response)
    
    func routeTo()
}
