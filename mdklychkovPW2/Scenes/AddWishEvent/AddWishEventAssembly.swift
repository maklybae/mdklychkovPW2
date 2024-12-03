//
//  AddWishEventAssembly.swift
//  mdklychkovPW2
//
//  Created by Maksim Klychkov on 03.12.2024.
//

import Foundation
import UIKit

enum AddWishEventAssembly {
    // MARK: - Build
    static func build(withColor color: UIColor) -> UIViewController {
        let presenter = AddWishEventPresenter()
        let interactor = AddWishEventInteractor(presenter: presenter)
        let view = AddWishEventViewController(interactor: interactor, color: color)
        presenter.view = view
        
        return view
    }
}
