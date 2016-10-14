//
//  PayOnline.swift
//  Payonline
//
//  Created by Zhanserik on 10/7/16.
//  Copyright © 2016 Kenes Inc. All rights reserved.
//

import UIKit

class PayOnline: NSObject {
    static var configs: PayOnlineConfiguration?
    
    public class func initialize(with configuration: PayOnlineConfiguration){
        super.initialize()
        configs = configuration
    }
}

class PayOnlineConfiguration: NSObject {
    
    var merchantId: Int?
    var privateSecurityKey: String?
    var paymentKey: String?
    var host: String?
    
    convenience init(closure: (PayOnlineConfiguration) -> (Void)) {
        self.init()
        closure(self)
    }
}

struct PayOnlinePath {
    static let base = "https://secure.payonlinesystem.com/payment/transaction/"
    
    static let auth = "\(base)auth/"
    static let threeDS = "\(base)auth/3ds/"
    static let complete = "\(base)complete/"
    static let rebill = "\(base)rebill/"
    static let refill = "\(base)refill/"
    static let void = "\(base)void/"
    static let refund = "\(base)refund/"
    static let check = "\(base)check/"
    
    //-->
    static let search = "https://secure.payonlinesystem.com/payment/search/"
    static let list = "https://secure.payonlinesystem.com/payment/transaction/list/"
    static let card2Card = "https://secure.payonlinesystem.com/payment/transaction/card2card/"
    static let card2Card3DS = "https://secure.payonlinesystem.com/payment/transaction/auth/card2card/"
}
