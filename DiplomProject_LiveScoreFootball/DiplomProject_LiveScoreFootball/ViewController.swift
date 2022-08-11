//
//  ViewController.swift
//  DiplomProject_LiveScoreFootball
//
//  Created by admin on 9.08.22.
//

import UIKit

class ViewController: UIViewController {
    var alamofireAPIProvider: RestAPIProviderProtocol!
    override func viewDidLoad() {
        super.viewDidLoad()
        alamofireAPIProvider = AlamofireAPIProvider()
        
        alamofireAPIProvider.getCountries { result in
            switch result {
            case .success(let value):
                print(value)
            case .failure(let error):
                print(error)
            }
        }
    }


}

