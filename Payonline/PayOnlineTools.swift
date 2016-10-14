//
//  PayOnlineTools.swift
//  Payonline
//
//  Created by Zhanserik on 10/7/16.
//  Copyright © 2016 Kenes Inc. All rights reserved.
//

import UIKit

public enum PayOnlineCurrency: String{
    case RUB = "RUB"
    case USD = "USD"
    case EUR = "EUR"
    case GBP = "GBP"
    case KZT = "KZT"
    case KGS = "KGS"
    case TJS = "TJS"
    case HKD = "HKD"
    case PLN = "PLN"
    case CZK = "CZK"
    case SGD = "SGD"
    case Undefined = "Undefined"
}

/** Status of the transaction in the payment system PayOnline */
public enum PayOnlineStatus: Int {
    /** Успешная трансакция, деньги на карте авторизованы, но могут быть разблокированы */
    case Pending = 0
    /** Успешная трансакция, деньги авторизованы, однако необходимо подтверждение мерчанта */
    case Authorized = 1
    /** Отклоненная трансакция */
    case Declined = 2
    /** Успешная трансакция, операция по переводу денежных средств завершена */
    case Settled = 3
    /** Трансакция отменена */
    case Voided = 4
    /** Необходимо пройти проверку 3DS */
    case Awaiting3DAuthentication = 5
    /** Неизвестный статус, возвращается, если трансакция не найдена */
    case Unknown = 6
}

/** Результат выполнения запроса к процессингову центру PayOnline */
public enum PayOnlineResult: Int {
    /** Авторизация прошла успешно */
    case Success = 0
    /** В процессе выполнения запроса, произошли ошибки */
    case Error = 1
    /** Запрос на авторизацию средств отклонен */
    case Declined = 2
    /** Необходимо пройти дополнительную проверку на стороне банка-эмитента */
    case CompleteValidation = 3
    /** Трансакция не найдена */
    case NotFound = 4
};

extension NSString {
    var md5: String {
        var digest = [UInt8](count: Int(CC_MD5_DIGEST_LENGTH), repeatedValue: 0)
        if let data = self.dataUsingEncoding(NSUTF8StringEncoding) {
            CC_MD5(data.bytes, CC_LONG(data.length), &digest)
        }
        var digestHex = ""
        for index in 0..<Int(CC_MD5_DIGEST_LENGTH) {
            digestHex += String(format: "%02x", digest[index])
        }
        
        return digestHex
    }
    public class func generateUniqueId() -> NSString {
        let uuid = NSUUID().UUIDString
        return uuid as NSString
    }
    public class func generateSecurityKey(merchantId: Int, orderId: String, amount: NSDecimalNumber, currency: PayOnlineCurrency, privateSecurityKey: String) -> String{
        let string = "MerchantId=\(merchantId)&OrderId=\(orderId)&Amount=\(amount.stringValue)&Currency=\(currency.rawValue)&PrivateSecurityKey=\(privateSecurityKey)"
        return string.md5
    }
}
