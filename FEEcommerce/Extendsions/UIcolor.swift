//
//  UIcolor.swift
//  FEEcommerce
//
//  Created by baohoang on 14/02/2022.
//

import Foundation
import UIKit

extension UIColor {
    convenience init(rgb: Int) {
        self.init(
            red: (rgb >> 16) & 0xFF,
            green: (rgb >> 8) & 0xFF,
            blue: rgb & 0xFF
        )
    }
}
