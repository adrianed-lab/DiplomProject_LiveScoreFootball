//
//  UiViewController+Extensions.swift
//  DiplomProject_LiveScoreFootball
//
//  Created by admin on 26.08.22.
//

import Foundation
import UIKit

extension UIView {
    // Метод получения скриншота текущего экрана
    func takeScreenShot() -> UIImage {
        UIGraphicsBeginImageContextWithOptions(self.bounds.size, false, UIScreen.main.scale)
        
        drawHierarchy(in: self.bounds, afterScreenUpdates: true)
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        if image != nil {
            return image!
        }
        return UIImage()
    }
}


