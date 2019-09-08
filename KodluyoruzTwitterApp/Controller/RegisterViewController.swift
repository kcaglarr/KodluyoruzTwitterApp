//
//  RegisterViewController.swift
//  KodluyoruzTwitterApp
//
//  Created by XCODE on 7.09.2019.
//  Copyright © 2019 kerimcaglar. All rights reserved.
//

import UIKit
import Firebase

class RegisterViewController: UIViewController {
    @IBOutlet weak var emailField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    
    var ref = Database.database().reference()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        passwordField.setRightIcon(icon: UIImage(named: "show-password")!)
    }
    
    
    @IBAction func registerButtonAction(_ sender: Any) {
        guard let email = emailField.text else { return }
        guard let password = passwordField.text else { return }
        
        //Förbeys e yaz
        
        Auth.auth().createUser(withEmail: email, password: password) { result, error in
            if error != nil {
                guard let error = error else { return }
                
                if let errorCode = AuthErrorCode(rawValue: error._code) {
                    switch errorCode {
                    case .emailAlreadyInUse:
                        self.showAlert(title: "Error", message: "Email already in use", actionOk: "OK", actionCancel: "Cancel")
                    case .weakPassword:
                        self.showAlert(title: "Error", message: "Weak password", actionOk: "OK", actionCancel: "Cancel")
                    case .invalidEmail:
                        self.showAlert(title: "Error", message: "Invalid email", actionOk: "OK", actionCancel: "Cancel")
                    case .operationNotAllowed:
                        self.showAlert(title: "Error", message: "Operation not allowed", actionOk: "OK", actionCancel: "Cancel")
                    default:
                        self.showAlert(title: "Error", message: "Something is wrong", actionOk: "OK", actionCancel: "Cancel")

                    }
                }
                
            }
            else {
                self.ref.child("users").child((result?.user.uid)!).setValue(["email": email])
                //TODO: kayıt işleminden sonra login sayfasına yönlendirilme işlemi yapılacak
                print("Kaydedildi")
            }
        }
    }
    
    
    @IBAction func backButtonAction(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
}
