//
//  WishStoringAssembly.swift
//  mdklychkovPW2
//
//  Created by Maksim Klychkov on 03.11.2024.
//

import UIKit

enum WishStoringAssembly {
    static func build() -> UIViewController {
        let presenter = WishStoringPresenter()
        let interactor = WishStoringInteractor(presenter: presenter)
        let view = WishStoringViewController(interactor: interactor)
        presenter.view = view
        
        return view
    }
}

