//
//  PayOnlineQuery.swift
//  Payonline
//
//  Created by Zhanserik on 10/7/16.
//  Copyright © 2016 Kenes Inc. All rights reserved.
//

import UIKit
import Alamofire
import AEXML

class PayOnlineAuthQuery: NSObject {
    /** Required. Identifier of order in merchant system
        String: (<=50 symbols)*/
    var orderId: String?
    /** Required. Order amount
        Decimal Number:*/
    var amount: NSDecimalNumber?
    /** Required. Currency of order*/
    var currency: PayOnlineCurrency = .Undefined
    /** Optional. Ip address of customer
        String: (xxx.xxx.xxx.xxx)*/
    var ip: String?
    /** Optional. Email of customer
        String: (<=50 symbols)*/
    var email: String?
    /** Required. 
        String: (<= 100 symbols)*/
    var cardHolderName: String?
    /** Required. 
        Number: (13-19 digits)*/
    var cardNumber: String?
    /** Required. 
        Number: (MMYY format)*/
    var cardExpDate: String?
    /** Required. 
        Number: (3 numbers)*/
    var cardCVV: String?
    /** Optional. 
        String: (2 symbols => ISO-3166)*/
    var country: String?
    /** Optional. 
        String: (<=50 symbols)*/
    var city: String?
    /** Optional. 
        String: (<=150 symbols)*/
    var address: String?
    /** Optional. 
        String: (<=10 symbols)*/
    var zip: Int?
    /** Optional. 
        String: (2 symbols US or Canada)*/
    var state: String?
    /** Optional. 
        String: (<=50 symbols)*/
    var phone: String?
    /** Optional.
        String: (<=100 symbols)*/
    var issuer: String?
    /** Optional.
        String: (xml or text)*/
    var contentType: String = "xml"
    
    convenience init(closure: (PayOnlineAuthQuery) -> (Void)) {
        self.init()
        closure(self)
    }
    
    private func createRequestParams() -> [String:AnyObject]? {
        guard let merchantId = PayOnline.configs?.merchantId,
            let orderId = orderId,
            let privateKey = PayOnline.configs?.privateSecurityKey,
            let amount = amount where
            currency != .Undefined else {
                return nil
        }
        
        let securityKey = NSString.generateSecurityKey(merchantId, orderId: orderId, amount: amount, currency: currency, privateSecurityKey: privateKey)
        
        var params = [
            "MerchantId": merchantId,
            "OrderId": orderId,
            "Amount": amount.stringValue,
            "Currency": currency.rawValue,
            "SecurityKey": securityKey
        ] as [String: AnyObject]
        
        guard let cardHolderName = cardHolderName,
            let cardNumber = cardNumber,
            let cardExpDate = cardExpDate,
            let cardCVV = cardCVV
            else {
                return nil
        }
        params["CardHolderName"] = cardHolderName
        params["CardNumber"] = cardNumber
        params["CardExpDate"] = cardExpDate
        params["CardCvv"] = cardCVV
        
        params["Country"] = country
        params["City"] = city
        params["Address"] = address
        params["Zip"] = zip
        params["State"] = state
        params["Phone"] = phone
        params["Issuer"] = issuer
        params["Ip"] = ip
        params["Email"] = email
        params["ContentType"] = contentType
        
        return params
    }
    
    func pay(closure: (PayOnlineResponse?, PayOnlineError?) -> Void){
        guard let params = self.createRequestParams() else {
            return
        }
        
        Alamofire.request(.POST, PayOnlinePath.auth, parameters: params).responseData{ response in
            guard let value = response.result.value else {return}
            do {
                let xmlDoc = try AEXMLDocument(xmlData: value)
                print(xmlDoc.xmlString)
                
                if xmlDoc.root.name == "error" {
                    let errorCode = xmlDoc.root["code"].intValue
                    if UnknownErrorMessage == PayOnlineError.description(errorCode) {
                        let message = xmlDoc.root["message"].stringValue
                        closure(nil, PayOnlineError.error(errorCode, message: message))
                    }
                    else{
                        closure(nil, PayOnlineError.error(errorCode))
                    }
                }
                else if (xmlDoc.root.name == "transaction") {
                    let response = PayOnlineResponse {
                        $0.transactionId = xmlDoc.root["id"].stringValue
                        $0.code = xmlDoc.root["code"].intValue
                        $0.mechantId = xmlDoc.root["merchantId"].intValue
                        $0.errorCode = xmlDoc.root["errorCode"].intValue
                        $0.result = xmlDoc.root["result"].stringValue
                        $0.status = xmlDoc.root["status"].stringValue
                    }
//                    if let threeDSecureDoc = xmlDoc.root["threedSecure"]{
//                        let data = PayOnline3DSData {
//                            $0.pareq = threeDSecureDoc["pareq"].stringValue
//                            $0.acsurl = threeDSecureDoc["acsurl"].stringValue
//                            $0.pd = threeDSecureDoc["pd"].stringValue
//                        }
//                        response.threeDsData = data
//                    }
                    closure(response, nil)
                                        
                }
                else{
                    closure(nil, PayOnlineError.error(-1, message: UnknownErrorMessage))
                }
                
            }
            catch {
//                closure(nil, )
            }
            
        }
        
        
    }
}
