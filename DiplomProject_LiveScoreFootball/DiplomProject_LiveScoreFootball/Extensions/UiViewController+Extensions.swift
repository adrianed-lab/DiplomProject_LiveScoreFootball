//
//  UiViewController+Extensions.swift
//  DiplomProject_LiveScoreFootball
//
//  Created by admin on 26.08.22.
//

import Foundation
import UIKit

extension UIViewController {
    func addButtons() {
        //let searchButton = UIButton()
        //searchButton.frame = CGRect
        self.navigationItem.rightBarButtonItems = [UIBarButtonItem(image: UIImage(systemName: "gear"), style: .done, target: self, action: nil), UIBarButtonItem(barButtonSystemItem: .search, target: self, action: nil)]
    }
}
