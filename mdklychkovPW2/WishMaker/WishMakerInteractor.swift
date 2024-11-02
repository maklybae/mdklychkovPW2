//
//  WishMakerInteractor.swift
//  mdklychkovPW2
//
//  Created by Maksim Klychkov on 30.10.2024.
//

final class Interactor: BuisnessLogic {
    // MARK: - Constants
    private enum Constants {
        static let hexColorBinaryExp: Int = 24
        static let colorParameterCount: Int = 256
        static let defaultAlpha: Double = 1.0
    }
    
    // MARK: - Variables
    private let presenter: PresentaionLogic
    
    init(presenter: PresentaionLogic) {
        self.presenter = presenter
    }
    
    // MARK: - Use Case: Change background color
    func changeBackgroundColor(_ request: WishMaker.ChangeBackgroundColor.Request) {
        presenter.presentChangedBackgroundColor(WishMaker.ChangeBackgroundColor.Response(red: request.red, green: request.green, blue: request.blue, alpha: Constants.defaultAlpha))
    }
    
    // MARK: - Use Case: Randomize background color
    func randomizeBackgroundColor(_ request: WishMaker.RandomizeBackgroundColor.Request) {
        // hex color is a number #______
        // need to generate an hex integer (from 0 to (16^6 - 1))
        // 16^6 = (2^4)^6 = 2^24 = 1 << 24
        var intColor = Int.random(in: 0...(1 << Constants.hexColorBinaryExp))
        
        // need to parse it into r, g, b segments, from (0 to 16^2 - 1) each
        let red: Double = Double(intColor % Constants.colorParameterCount) / Double(Constants.colorParameterCount - 1)
        intColor /= Constants.colorParameterCount
        let green: Double = Double(intColor % Constants.colorParameterCount) / Double(Constants.colorParameterCount - 1)
        intColor /= Constants.colorParameterCount
        let blue: Double = Double(intColor % Constants.colorParameterCount) / Double(Constants.colorParameterCount - 1)
        
        presenter.presentRandomizedBackgroundColor(WishMaker.RandomizeBackgroundColor.Response(red: red, green: green, blue: blue, alpha: Constants.defaultAlpha))
    }
}
