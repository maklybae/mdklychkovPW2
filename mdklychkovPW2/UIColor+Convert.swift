//
//  UIColor+Convert.swift
//  mdklychkovPW2
//
//  Created by Maksim Klychkov on 02.11.2024.
//

import UIKit

extension UIColor {
    func toHex() -> String? {
        return String(format: "#%02X%02X%02X", Int(red * 255), Int(green * 255), Int(blue * 255))
    }
    
    var red: CGFloat {
        let ciColor = CIColor(color: self)
        return ciColor.red
    }
    
    var green: CGFloat {
        let ciColor = CIColor(color: self)
        return ciColor.green
    }
    
    var blue: CGFloat {
        let ciColor = CIColor(color: self)
        return ciColor.blue
    }
}
