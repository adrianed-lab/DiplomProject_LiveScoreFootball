//
//  AuthorizationViewController.swift
//  DiplomProject_LiveScoreFootball
//
//  Created by admin on 14.09.22.
//

import UIKit
import SnapKit
import Firebase
import FirebaseAuth
import RealmSwift

protocol AuthorizationViewProtocol: AnyObject {
    
}

class AuthorizationViewController: UIViewController, AuthorizationViewProtocol {
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var logInButton: UIButton!
    @IBOutlet weak var notRegistredLable: UILabel!
    @IBOutlet weak var signUpButton: UIButton!
    
    var presenter: AuthorizationViewPresenterProtocol!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Login"
        logInButton.tintColor = .blue
    
    }
    // Вход в аккаунт
    @IBAction func logIn(_ sender: Any) {
        guard let email = emailTextField.text, let password = passwordTextField.text else {return}
        Auth.auth().signIn(withEmail: email, password: password) { [weak self] result, error in
            guard let self = self else {return}
            if error != nil {
                let allertMessage = UIAlertController(title: "Warning!", message: "The email or password is incorrect, please check the entered data", preferredStyle: .alert)
                let okButton = UIAlertAction(title: "Ok", style: .cancel)
                allertMessage.addAction(okButton)
                self.present(allertMessage, animated: true)
            } else {
                let allertMessage = UIAlertController(title: "Success!", message: "Login Successful", preferredStyle: .alert)
                let okButton = UIAlertAction(title: "Ok", style: .cancel) { _ in
                    self.presenter.popToRoot()
                }
                allertMessage.addAction(okButton)
                self.present(allertMessage, animated: true)
                }
            }
        }
    
   // Переход на экран регистрации
    @IBAction func signUp(_ sender: Any) {
        presenter.getRegistrationVC()
    }
}
