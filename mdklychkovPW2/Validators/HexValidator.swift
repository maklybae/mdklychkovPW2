//
//  HexValidator.swift
//  mdklychkovPW2
//
//  Created by Maksim Klychkov on 02.11.2024.
//

import Foundation

class HexValidator: Validator {
    func validate(_ input: String) -> Bool {
        let hexRegex = "^#[0-9A-F]{6}$"
        let predicate = NSPredicate(format: "SELF MATCHES %@", hexRegex)
        
        return predicate.evaluate(with: input)
    }
}
