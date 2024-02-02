//
//  Extension.swift
//  UXApp-iOS-YakoDesign
//
//  Created by Jacobo Ramirez on 2/02/24.
//

import Foundation
import UIKit
extension UIButton {
    func setCornerRadius(_ radius: CGFloat) {
        self.layer.cornerRadius = radius
        self.layer.masksToBounds = true
    }
}
