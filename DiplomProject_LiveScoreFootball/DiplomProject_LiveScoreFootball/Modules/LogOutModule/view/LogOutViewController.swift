//
//  LogOutViewController.swift
//  DiplomProject_LiveScoreFootball
//
//  Created by admin on 15.09.22.
//

import UIKit
import Firebase
import FirebaseAuth

protocol LogOutViewControllerProtocol: AnyObject {
    func configureLable(firstName: String, lastName: String)
}

class LogOutViewController: UIViewController, LogOutViewControllerProtocol {
    @IBOutlet weak var firstNameLastName: UILabel!
    @IBOutlet weak var logOutButton: UIButton!
    @IBOutlet weak var successPerson: UIImageView!
    let firebaseAuth = Auth.auth()
    var presenter: LogOutViewPresenterProtocol!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.configure()
    }
    func configureLable(firstName: String, lastName: String) {
        firstNameLastName.text = "\(firstName) \(lastName)"
    }
    
    // Выход из аккаунта
    @IBAction func logOut(_ sender: Any) {
        let allertMessage = UIAlertController(title: "", message: "Are you sure you want to log out?", preferredStyle: .alert)
        let okButton = UIAlertAction(title: "Ok", style: .default) {  _ in
            do {
                try self.firebaseAuth.signOut()
                // После нажатия кнопки OK будет переход на экран LoginVC
                self.presenter.getAuthVC()
            } catch let signOutError as NSError {
            print("Error signing out: %@", signOutError)
            }
        }
        let cancelButton = UIAlertAction(title: "Cancel", style: .destructive)
        allertMessage.addAction(okButton)
        allertMessage.addAction(cancelButton)
        self.present(allertMessage, animated: true)
    }
}
