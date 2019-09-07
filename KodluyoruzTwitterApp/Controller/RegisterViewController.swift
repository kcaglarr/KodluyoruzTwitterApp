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
                print(error?.localizedDescription)
            }else {
                print("Kaydedildi")
            }
        }
    }
    
    
    @IBAction func backButtonAction(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
}
