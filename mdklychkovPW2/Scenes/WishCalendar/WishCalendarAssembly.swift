//
//  WishMakerAssembly.swift
//  mdklychkovPW2
//
//  Created by Maksim Klychkov on 30.10.2024.
//

import UIKit

enum WishCalendarAssembly {
    // MARK: - Build
    static func build(withColor color: UIColor) -> UIViewController {
        let presenter = WishCalendarPresenter()
        let interactor = WishCalendarInteractor(presenter: presenter)
        let view = WishCalendarViewController(interactor: interactor, color: color)
        presenter.view = view
        
        return view
    }
}
