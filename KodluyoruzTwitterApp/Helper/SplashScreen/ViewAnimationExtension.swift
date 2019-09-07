//
//  ViewAnimationExtension.swift
//  TwitterKodluyoruzTest
//
//  Created by kerimcaglar on 1.09.2019.
//  Copyright © 2019 kerimcaglar. All rights reserved.
//

import UIKit

extension UIViewController {
    func loadTwitterSplashAnimation() -> Void {
        let splashView = SplashView(iconImage: UIImage(named: "twitter-logo")!,iconInitialSize: CGSize(width: 70, height: 70), backgroundColor: UIColor(red: 70/255, green: 154/255, blue: 233/255, alpha: 1))
        
        self.view.addSubview(splashView)
        
        splashView.duration = 5.0
        splashView.animationType = AnimationType.twitter
        
        splashView.startAnimation(){
            print("Completed")
        }
        
        // This will deliver the message to stop the heartbeat/twitter
        // Need to call like same after the completion of API, means when screen transition needs.
        // Comment and run this, you will see heartbeat will never stops.
        DispatchQueue.main.asyncAfter(deadline: .now() + 3.0, execute: {
            print("Heart/twitter Attack Stopped")
            splashView.finishHeartBeatAnimation()
        })
    }

}


