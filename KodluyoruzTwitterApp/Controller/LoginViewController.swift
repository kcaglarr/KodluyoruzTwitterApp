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
        
    
        
        addToolBar(textField: emailTextField)
        addToolBar(textField: passwordTextField)
        // Do any additional setup after loading the view.
        passwordTextField.setRightIcon(icon: UIImage(named: "show-password")!)
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
                self?.goToDestination(destinationName: "HomeVC")
            }
        }
        
        
    }
    

}

extension LoginViewController: UITextViewDelegate {
    func addToolBar(textField: UITextField) {
        let toolbar = UIToolbar()
        // toolbar configuration
        toolbar.barStyle = UIBarStyle.default
        toolbar.isTranslucent = true
        toolbar.tintColor = #colorLiteral(red: 0.2392156869, green: 0.6745098233, blue: 0.9686274529, alpha: 1)
        
        // bar buttons (password,space,login)
        let passwordButton = UIBarButtonItem(title: "Sifremi Unuttum", style: .done, target: self, action: #selector(passwordForgetPressed))
        let loginButton = UIBarButtonItem(title: "Giris", style: .done, target: self, action: #selector(loginPressed))
        let spaceArea = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.flexibleSpace, target: nil, action: nil)
        
        toolbar.setItems([passwordButton,spaceArea,loginButton], animated: true)
        toolbar.isUserInteractionEnabled = true
        toolbar.sizeToFit()
        
        textField.inputAccessoryView = toolbar
    }
    
    @objc func passwordForgetPressed() {
        print("password")
    }
    
    @objc func loginPressed() {
        print("login")
        //Förbeyzde kayıtlı kullanıcının girmesini sağlayıp, eğer o kullanıcı yoksa hata mesajları vereceğiz
        
    }
}

