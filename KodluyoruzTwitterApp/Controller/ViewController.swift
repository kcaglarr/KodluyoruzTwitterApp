//
//  ViewController.swift
//  KodluyoruzTwitterApp
//
//  Created by kerimcaglar on 7.09.2019.
//  Copyright © 2019 kerimcaglar. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        loadTwitterSplashAnimation()
    }

    @IBAction func goAccountPageAction(_ sender: Any) {
        
        let storyboard:UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let accountPageVC = storyboard.instantiateViewController(withIdentifier: "AccountPageVC") as? RegisterViewController
        
        present(accountPageVC!, animated: true, completion: nil)
    }
    
}

