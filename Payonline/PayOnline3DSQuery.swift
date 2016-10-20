//
//  PayOnline3DSQuery.swift
//  Payonline
//
//  Created by Zhanserik on 10/10/16.
//  Copyright © 2016 Kenes Inc. All rights reserved.
//

import UIKit
import SwiftWebVC

class PayOnline3DSQuery: NSObject {
    var threeDSData: PayOnline3DSData?
    
    func authorize(closure: (PayOnlineError?) -> Void){
        guard
            let threeDSData = threeDSData,
            let pareq = threeDSData.pareq,
            let acsurl = threeDSData.acsurl,
            let md = threeDSData.md
        else {
            closure(PayOnlineError.error(FormatError))
            return
        }
        guard let url = NSURL(string: acsurl) else {
            closure(PayOnlineError.error(FormatError))
            return
        }
        let request = NSURLRequest(URL: url)
        
    }
}
