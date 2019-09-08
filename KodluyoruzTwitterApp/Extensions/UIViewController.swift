//
//  UIViewController.swift
//  KodluyoruzTwitterApp
//
//  Created by XCODE on 7.09.2019.
//  Copyright © 2019 kerimcaglar. All rights reserved.
//

import UIKit

extension UIViewController {
    func goToDestination(destinationName:String) {
        let storyboard:UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let HomePageVC = storyboard.instantiateViewController(withIdentifier: destinationName)
        
        self.present(HomePageVC, animated: true, completion: nil)

    }
    
    
    func showAlert(title: String, message: String, actionOk: String, actionCancel: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let actionOk = UIAlertAction(title: actionOk, style: .default, handler: nil)
        let actionCancel = UIAlertAction(title: actionCancel, style: .cancel, handler: nil)
        alert.addAction(actionOk)
        alert.addAction(actionCancel)
        self.present(alert, animated: true, completion: nil)
    }
}


extension UIViewController: UITextViewDelegate {
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
    }
}
