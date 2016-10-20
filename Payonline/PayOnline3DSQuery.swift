//
//  PayOnline3DSQuery.swift
//  Payonline
//
//  Created by Zhanserik on 10/10/16.
//  Copyright © 2016 Kenes Inc. All rights reserved.
//

import UIKit
import SVWebViewController

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
        
        let params: [String:String] = [
            "PaReq":pareq,
            "MD":md,
            "TermUrl":"http://getimbra.com"
        ]
        let requestString = String.urlEncodedStringFromDictionary(params)
        let request = NSMutableURLRequest(URL: url)
        request.setValue("application/x-www-form-urlencoded; charset=utf-8", forHTTPHeaderField: "Content-Type")
        request.HTTPMethod = "POST"
        request.HTTPBody = requestString.dataUsingEncoding(NSUTF8StringEncoding)
        
        print("\(request)")
    }
}
extension String {
    func urlEncode() -> String?{
        return self.stringByAddingPercentEncodingWithAllowedCharacters(.URLHostAllowedCharacterSet())
    }
    static func urlEncodedStringFromDictionary(params: [String: String]) -> String{
        var paramsList: [String] = []
        for (key, value) in params {
            paramsList.append("\(key.urlEncode()!)=\(value.urlEncode()!)")
        }
        return paramsList.joinWithSeparator("$")
    }
}
