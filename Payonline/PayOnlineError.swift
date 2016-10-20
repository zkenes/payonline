//
//  PayOnlineError.swift
//  Payonline
//
//  Created by Zhanserik on 10/7/16.
//  Copyright © 2016 Kenes Inc. All rights reserved.
//

import UIKit

public let IncorrectCardNumber = 4004
public let IncorrectCardHolderName = 4005
public let IncorrectCardVerificationCode = 4006
public let IncorrectCardExpDate = 4007
public let IncorrectCountry = 4008
public let IncorrectCity = 4009
public let IncorrectState = 4010
public let IncorrectZIPCode = 4011
public let IncorrectAddress = 4012
public let IncorrectBankIssuerName = 4013
public let CardExpired = 4014
public let IncorrectCardType = 4015
public let OrderAlreadyPaid = 4016
public let IncorrectEmail = 4017
public let IncorrectIpAddress = 4018
public let IncorrectPhone = 4019
public let IncorrectRebillAnchor = 4021
public let RebillNotAllowed = 4022
public let IncorrectSecurityKey = 4024
public let IncorrectOrderId = 4025
public let IncorrectCurrency = 4026
public let IncorrectMerchant = 4027
public let IncorrectValidUntil = 4028
public let IncorrectTransactionId = 4029
public let IncorrectIData = 4030
public let IncorrectPhoneNumber = 4032
public let IncorrectPhoneNumberFormat = 4033
public let IncorrectParams = 4300

public let AccountNotFound = 5201
public let UnableToProcess = 5204
public let InsufficientFunds = 5205
public let CardExpiredOrIncorrectDate = 5301
public let DeclinedByIssuer = 5302
public let UnsupportedTransaction = 5303
public let FinancialInstitutionProhibited = 5304
public let LostOrStolenCard = 5305
public let IncorrectCardStatus = 5306
public let LimitedCard = 5307
public let UnableToAuthorize = 5308
public let CardActivityLimitExceeded = 5310
public let UnsupportedCard = 5320
public let FormatError = 5333
public let ProcessingTimeOut = 5334
public let ProccessingServerError = 5396
public let CallIssuer = 5401
public let Incorrect3DSecureData = 5410
public let IncorrectCvv2Cvc2 = 5411
public let GatewayServerError = 5809

public let ThreeDSecureRequired = 6001
public let ThreeDSecureAuthenticationError = 6002
public let ThreeDSecureFailed = 6003
public let ThreeDSecureUnavailable = 6004

public let UnknownErrorMessage = "Unknown Error"

class PayOnlineError: NSError {
    static let domain = "com.payonline"
    
    class func error(code: Int, message: String) -> PayOnlineError {
        let userInfo = [NSLocalizedDescriptionKey : message]
        let error = PayOnlineError(domain: domain, code: code, userInfo: userInfo)
        return error
    }
    
    class func error(code: Int) -> PayOnlineError {
        return PayOnlineError.error(code, message: description(code))
    }
    
    class func description(errorCode: Int) -> String {
        
        switch errorCode {
        case IncorrectCardNumber:
            return "Incorrect Card Number"
        case IncorrectCardHolderName:
            return "Incorrect Card Holder Name"
        case IncorrectCardVerificationCode:
            return "Incorrect Card Verification Code"
        case IncorrectCardExpDate:
            return "Incorrect Card Expiration Date"
        case IncorrectCountry:
            return "Incorrect Country"
        case IncorrectCity:
            return "Incorrect City"
        case IncorrectState:
            return "Incorrect State"
        case IncorrectZIPCode:
            return "Incorrect ZIP Code"
        case IncorrectAddress:
            return "Incorrect Address"
        case IncorrectBankIssuerName:
            return "IncorrectBankIssuerName"
        case CardExpired:
            return "Card Expired"
        case IncorrectCardType:
            return "Incorrect Card Type"
        case OrderAlreadyPaid:
            return "Order Already Paid"
        case IncorrectEmail:
            return "Incorrect Email"
        case IncorrectIpAddress:
            return "IncorrectIpAddress"
        case IncorrectPhone:
            return "Incorrect Phone"
        case IncorrectRebillAnchor:
            return "Incorrect Rebill Anchor"
        case RebillNotAllowed:
            return "Rebill Not Allowed"
        case IncorrectSecurityKey:
            return "Incorrect Security Key"
        case IncorrectOrderId:
            return "Incorrect OrderId"
        case IncorrectCurrency:
            return "Incorrect Currency"
        case IncorrectMerchant:
            return "IncorrectMerchant"
        case IncorrectValidUntil:
            return "Incorrect Valid Until"
        case IncorrectTransactionId:
            return "Incorrect TransactionId"
        case IncorrectIData:
            return "Incorrect IData"
        case IncorrectPhoneNumber:
            return "Incorrect Phone Number"
        case IncorrectPhoneNumberFormat:
            return "Incorrect Phone Number Format"
        case IncorrectParams:
            return "Incorrect Params"
            
        case AccountNotFound:
            return "Account Not Found"
        case UnableToProcess:
            return "Unable To Process"
        case InsufficientFunds:
            return "Insufficient Funds"
        case CardExpiredOrIncorrectDate:
            return "Card Expired Or Incorrect Date"
        case DeclinedByIssuer:
            return "Declined By Issuer"
        case UnsupportedTransaction:
            return "Unsupported Transaction"
        case FinancialInstitutionProhibited:
            return "Financial Institution Prohibited"
        case LostOrStolenCard:
            return "Lost Or Stolen Card"
        case IncorrectCardStatus:
            return "Incorrect Card Status"
        case LimitedCard:
            return "Limited Card"
        case UnableToAuthorize:
            return "Unable To Authorize"
        case CardActivityLimitExceeded:
            return "Card Activity Limit Exceeded"
        case UnsupportedCard:
            return "Unsupported Card"
        case FormatError:
            return "Format Error"
        case ProcessingTimeOut:
            return "Processing Time Out"
        case ProccessingServerError:
            return "Proccessing Server Error"
        case CallIssuer:
            return "Call Issuer"
        case Incorrect3DSecureData:
            return "Incorrect 3D Secure Data"
        case IncorrectCvv2Cvc2:
            return "Incorrect Cvv2 Cvc2"
        case GatewayServerError:
            return "Gateway Server Error"
        
        case ThreeDSecureRequired:
            return "3DSecure Required"
        case ThreeDSecureAuthenticationError:
            return "3DSecure Authentication Error"
        case ThreeDSecureFailed:
            return "3DSecure Failed"
        case ThreeDSecureUnavailable:
            return "3DSecure Unavailable"
        default:
            return UnknownErrorMessage
        }
    }
    
}
