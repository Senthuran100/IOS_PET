//
//  Categories+Extensions.swift
//  PersonalExpenseTracker
//
//  Created by Senthuran on 12/20/20.
//

import Foundation
import UIKit
import FontAwesome_swift

enum PETIconConfig {
    static let style: FontAwesomeStyle = .solid
    static let color: UIColor = .black
    static let defaultSize = CGSize(width: 128, height: 128)
}

extension UIImage {
    static func PETFontIcon(
        name: FontAwesome,
        size: CGSize = PETIconConfig.defaultSize) -> UIImage {

        return UIImage.fontAwesomeIcon(
            name: name,
            style: PETIconConfig.style,
            textColor: PETIconConfig.color,
            size: size
        )
    }
}

extension Categories {
    func iconImage(size: CGSize = PETIconConfig.defaultSize) -> UIImage? {
        guard !self.icon!.isEmpty,
              let font = FontAwesome(rawValue: self.icon!) else {
            let defaultIcon = self.direction > 0 ? "UpIcon" : "DownIcon"
            return UIImage(named: defaultIcon)
        }

        return UIImage.PETFontIcon(
            name: font,
            size: size
        )
    }
}
