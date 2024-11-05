//
//  WishMakerAssembly.swift
//  mdklychkovPW2
//
//  Created by Maksim Klychkov on 30.10.2024.
//

import UIKit

enum WishMakerAssembly {
    // MARK: - Build
    static func build() -> UIViewController {
        let presenter = WishMakerPresenter()
        let interactor = WishMakerInteractor(presenter: presenter)
        let view = WishMakerViewController(interactor: interactor)
        presenter.view = view
        
        return view
    }
}
