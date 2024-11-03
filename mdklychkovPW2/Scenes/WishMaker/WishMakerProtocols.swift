//
//  WishMakerProtocols.swift
//  mdklychkovPW2
//
//  Created by Maksim Klychkov on 30.10.2024.
//

// MARK: - BuisnessLogic protocol
protocol WishMakerBuisnessLogic {
    func changeBackgroundColor(_ request: WishMaker.ChangeBackgroundColor.Request)
    func randomizeBackgroundColor(_ request: WishMaker.RandomizeBackgroundColor.Request)
    func setHexColor(_ request: WishMaker.SetHexColor.Request)
}

// MARK: - PresentationLogic protocol
protocol WishMakerPresentaionLogic {
    func presentChangedBackgroundColor(_ response: WishMaker.ChangeBackgroundColor.Response)
    func presentRandomizedBackgroundColor(_ response: WishMaker.RandomizeBackgroundColor.Response)
    func presentSetHexColor(_ response: WishMaker.SetHexColor.Response)
    
    func routeTo()
}
