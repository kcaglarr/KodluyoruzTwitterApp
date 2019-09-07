//
//  LoginViewController.swift
//  KodluyoruzTwitterApp
//
//  Created by XCODE on 7.09.2019.
//  Copyright © 2019 kerimcaglar. All rights reserved.
//

import UIKit
import Firebase

class LoginViewController: UIViewController {
    @IBOutlet weak var emailTextField: UITextField!
    
    @IBOutlet weak var passwordTextField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func loginButtonAction(_ sender: Any) {
        
        guard let email = emailTextField.text else { return }
        guard let password = passwordTextField.text else { return }
        
        print(email, password)
        
        Auth.auth().signIn(withEmail: email, password: password) { [weak self] user, error in
            
            if error != nil {
                print(error?.localizedDescription)
            }
            else {
                let storyboard:UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
                let HomePageVC = storyboard.instantiateViewController(withIdentifier: "HomeVC") as? HomeViewController
                
                self?.present(HomePageVC!, animated: true, completion: nil)
            }
        }
        
        
    }
    

}