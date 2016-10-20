//
//  AppDelegate.swift
//  Payonline
//
//  Created by Zhanserik on 10/7/16.
//  Copyright © 2016 Kenes Inc. All rights reserved.
//

import UIKit
import CoreData

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject : AnyObject]?) -> Bool {
        
        let configuration = PayOnlineConfiguration {
            $0.merchantId = 75183
            $0.privateSecurityKey = "88a4d228-9a56-4818-a3c5-edaf4c37d383"
            $0.paymentKey = "2bf266aa-65af-4ce7-a4f5-ef9268f030ee"
        }
        PayOnline.initialize(with: configuration)
        
        
//        let query = PayOnlineQuery{
//            $0.orderId = "1234"
//            $0.amount = NSDecimalNumber(double: 1.55)
//            $0.currency = .KZT
//            $0.ip = "127.0.0.1"
//            $0.email = "zhans.kenes@gmail.com"
//            $0.cardHolderName = "ZHANSERIK KENES"
//            $0.cardCVV = "011"
//            $0.cardNumber = "5406520002028674"
//            $0.cardExpDate = "0721"
//            $0.city = "Almaty"
//        }
        
        let query = PayOnlineAuthQuery{
            $0.orderId = "123446"
            $0.amount = NSDecimalNumber(double: 22.49)
            $0.currency = .KZT
            $0.ip = "127.0.0.1"
            $0.email = "test@payonline.com"
            $0.cardHolderName = "MARAT SHAKEN"
            $0.cardCVV = "300"
//            $0.cardCVV = "111"
            $0.cardNumber = "4111111111111111"
            $0.cardExpDate = "1224"
            $0.city = "Almaty"
        }
        

        query.pay { (response, error) in
            print("Error: \(error)")
            print("Response: \(response)")
        }
        
        return true
    }
}

