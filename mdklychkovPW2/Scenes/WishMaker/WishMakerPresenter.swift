//
//  WishMakerPresenter.swift
//  mdklychkovPW2
//
//  Created by Maksim Klychkov on 30.10.2024.
//

import UIKit

final class WishMakerPresenter: WishMakerPresentaionLogic {
    // MARK: - Variables
    weak var view: WishMakerViewController?
    
    // MARK: - Use Case: Change background color
    func presentChangedBackgroundColor(_ response: WishMaker.ChangeBackgroundColor.Response) {
        view?.displayChangedBackground(.init(uiColor: .init(red: response.red, green: response.green, blue: response.blue, alpha: response.alpha)))
    }
    
    // MARK: - Use Case: Randomize background color
    func presentRandomizedBackgroundColor(_ response: WishMaker.RandomizeBackgroundColor.Response) {
        view?.displayRandomizedBackground(.init(uiColor: .init(red: response.red, green: response.green, blue: response.blue, alpha: response.alpha)))
    }
    
    // MARK: - Use Case: Randomize background color
    func presentSetHexColor(_ response: WishMaker.SetHexColor.Response) {
        view?.displaySetHexColor(.init(uiColor: .init(red: response.red, green: response.green, blue: response.blue, alpha: response.alpha)))
    }
    
    // MARK: - Router
    func routeToWishStoring(_ response: WishMaker.RouteToWishStoring.Response) {
        response.navigationController?.pushViewController(WishStoringAssembly.build(withColor: response.backgroundColor), animated: true)
    }
}
