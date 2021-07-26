//
//  UIButton.swift
//  BodyFit
//
//  Created by Ahmad Shahir Abdul Satar on 7/25/21.
//

import UIKit

extension UIButton {
    var isValid: Bool {
        get { isEnabled && backgroundColor == .black }
        set {
            backgroundColor = newValue ? .black : .brown
            isEnabled = newValue
        }
    }
}
