//
//  RegistrationViewController.swift
//  DiplomProject_LiveScoreFootball
//
//  Created by admin on 14.09.22.
//

import UIKit
import Firebase
import FirebaseAuth
import FirebaseFirestore
import FirebaseCore

protocol RegistrationViewProtocol: AnyObject {
    func checkValid() -> String?
}

class RegistrationViewController: UIViewController, RegistrationViewProtocol{
    @IBOutlet weak var firstNameTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var confirmPasswordTextField: UITextField!
    @IBOutlet weak var signUpButton: UIButton!
    @IBOutlet weak var lastNameTextFeild: UITextField!
    var presenter: RegistrationViewPresenterProtocol!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Registration"
        signUpButton.tintColor = .blue
    }
    
    // Метод проверки на пустоту текстфилдов и совпадение паролей
    func checkValid() -> String? {
        if emailTextField.text == "" || passwordTextField.text == "" || confirmPasswordTextField.text == "" || firstNameTextField.text == "" || lastNameTextFeild.text == "" {
            let allertMessage = UIAlertController(title: "Warning!", message: "Please, fill in all fields!", preferredStyle: .alert)
            let okButton = UIAlertAction(title: "Ok", style: .cancel)
            allertMessage.addAction(okButton)
            self.present(allertMessage, animated: true)
        } else if passwordTextField.text != confirmPasswordTextField.text {
            let allertMessage = UIAlertController(title: "Warning!", message: "Passwords do not match!", preferredStyle: .alert)
            let okButton = UIAlertAction(title: "Ok", style: .cancel)
            allertMessage.addAction(okButton)
            self.present(allertMessage, animated: true)
        }
        return nil
    }
    
    // Регистрация пользователя
    @IBAction func signUp(_ sender: Any) {
       
        if checkValid() != nil {
            print("Please, fill in all fields!")
        } else {
            guard let email = emailTextField.text, let password = passwordTextField.text, let firstName = firstNameTextField.text, let lastName = lastNameTextFeild.text else {return}
            Auth.auth().createUser(withEmail: email, password: password) { result, error in
                if error == nil {
                    guard let result = result else {return}
                    print(result.user.uid)
                    let dataBase = Firestore.firestore()
                    dataBase.collection("users").addDocument(data: ["firstname": firstName, "lastname": lastName, "email": email, "password": password, "uid": result.user.uid]) { [weak self] error in
                        guard let self = self else {return}
                        if error != nil {
                            print(error!.localizedDescription)
                        } else {
                            let alertMessage = UIAlertController(title: "Great!", message: "User successfully registered!", preferredStyle: .alert)
                            let okButton = UIAlertAction(title: "Ok", style: .cancel) { _ in
                                self.presenter.getAuthVC()
                            }
                            alertMessage.addAction(okButton)
                            self.present(alertMessage, animated: true)
                        }
                        
                    }
                }
            }
        }
    }
}
