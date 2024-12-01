//
//  WishStoringAssembly.swift
//  mdklychkovPW2
//
//  Created by Maksim Klychkov on 03.11.2024.
//

import UIKit

enum WishStoringAssembly {
    // MARK: - Build
    static func build(withColor color: UIColor) -> UIViewController {
        let presenter = WishStoringPresenter()
        let interactor = WishStoringInteractor(presenter: presenter)
        let viewController = WishStoringViewController(interactor: interactor)
        presenter.view = viewController
        
        viewController.view.backgroundColor = color
        return viewController
    }
}
