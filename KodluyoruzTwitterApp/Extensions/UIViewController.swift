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
}
