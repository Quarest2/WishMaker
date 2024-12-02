//
//  UIColor+Inverted.swift
//  WishMaker
//
//  Created by Аскар Ахметьянов on 02.12.2024.
//

import UIKit

extension UIColor {
    func inverted() -> UIColor {
        var red: CGFloat = 0
        var green: CGFloat = 0
        var blue: CGFloat = 0
        var alpha: CGFloat = 0
        
        self.getRed(&red, green: &green, blue: &blue, alpha: &alpha)
        
        let invertedRed = 1 - red
        let invertedGreen = 1 - green
        let invertedBlue = 1 - blue
        
        return UIColor(red: invertedRed, green: invertedGreen, blue: invertedBlue, alpha: alpha)
    }
}
