//
//  UITextFieldExtension.swift
//  KodluyoruzTwitterApp
//
//  Created by XCODE on 7.09.2019.
//  Copyright © 2019 kerimcaglar. All rights reserved.
//

import UIKit

extension UITextField {
    //Ödev image rendering mode
    func setRightIcon(icon:UIImage){
        let padding = 8
        let size = 20
        let textFieldView = UIView(frame: CGRect(x: 0, y: 12, width: 30, height: size))
        let iconButton = UIButton(frame: CGRect(x: padding, y: 0, width: size, height: size))
        iconButton.setImage(icon, for: .normal)
        iconButton.addTarget(self, action: #selector(showPassword), for: .touchUpInside)
        textFieldView.addSubview(iconButton)

        rightView = textFieldView
        rightViewMode = .always
    }
    
    @objc func showPassword(){
        //ÖDEV verilecek: tıklanınca bir daha kapanacak şifre alanı
        self.isSecureTextEntry = false //Gizliden çıkar
    }
}
