//
//  ViewController.swift
//  DiplomProject_LiveScoreFootball
//
//  Created by admin on 9.08.22.
//

import UIKit

protocol ScoreViewProtocol {
    func successGetMatchesByDate()
    func failure()
}

class ScoreViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }


}

extension ScoreViewController: ScoreViewProtocol {
    func successGetMatchesByDate() {
        <#code#>
    }
    
    func failure() {
        <#code#>
    }
    
    
}

