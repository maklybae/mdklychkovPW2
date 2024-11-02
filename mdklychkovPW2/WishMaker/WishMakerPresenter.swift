//
//  WishMakerPresenter.swift
//  mdklychkovPW2
//
//  Created by Maksim Klychkov on 30.10.2024.
//

import UIKit

final class Presenter: PresentaionLogic {
    // MARK: - Variables
    weak var view: WishMakerViewController?
    
    // MARK: - Use Case: Change background color
    func presentChangedBackgroundColor(_ response: WishMaker.ChangeBackgroundColor.Response) {
        view?.displayChangedBackground(WishMaker.ChangeBackgroundColor.ViewModel(uiColor: UIColor(red: response.red, green: response.green, blue: response.blue, alpha: response.alpha)))
    }
    
    // MARK: - Use Case: Randomize background color
    func presentRandomizedBackgroundColor(_ response: WishMaker.RandomizeBackgroundColor.Response) {
        view?.displayRandomizedBackground(WishMaker.RandomizeBackgroundColor.ViewModel(uiColor: UIColor(red: response.red, green: response.green, blue: response.blue, alpha: response.alpha)))
    }
    
    // MARK: - Router
    func routeTo() {
        view?.navigationController?.pushViewController(UIViewController(), animated: true)
    }
    
    
}
