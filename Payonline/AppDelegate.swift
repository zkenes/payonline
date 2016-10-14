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
            $0.privateSecurityKey = "baf994a7-77a9-4e9c-89c4-13c1e593a46e"
            $0.paymentKey = "df3d6705-0ba8-408b-a1c7-69c05fce1ea1"
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
            $0.orderId = "1234"
            $0.amount = NSDecimalNumber(double: 1.55)
            $0.currency = .KZT
            $0.ip = "127.0.0.1"
            $0.email = "test@payonline.com"
            $0.cardHolderName = "KHAKIM YESSENZHANOV"
//            $0.cardCVV = "319"
            $0.cardCVV = "111"
            $0.cardNumber = "5406520002061139"
            $0.cardExpDate = "0519"
            $0.city = "Almaty"
        }
        

        query.pay { (response, error) in
            print("Error: \(error)")
            print("Response: \(response)")
        }
        
        return true
    }
}

