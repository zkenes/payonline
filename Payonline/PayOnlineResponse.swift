//
//  PayOnlineResponse.swift
//  Payonline
//
//  Created by Zhanserik on 10/7/16.
//  Copyright © 2016 Kenes Inc. All rights reserved.
//

import UIKit

/**
 * Результат выполнения авторизации денежных средств на банковской карте
 */
class PayOnlineResponse: NSObject {
    /** ID трансакции в системе PayOnline */
    var transactionId: String?
    /** Результат выполнения операции */
//    var result: PayOnlineResult?
    var result: String?
    /** Статус трансакции */
//    var status: PayOnlineStatus?
    var status: String?
    /** Код ответа */
    var code: Int?
    /** Код ошибки, если она произошла в момент обработки запроса */
    var errorCode: Int?
    /** Информация, возвращаемая платежной системой, для прохождения проверки на стороне банка эмитента */
    var threeDsData: PayOnline3DSData?
    var mechantId: Int?
    
    convenience init(closure: (PayOnlineResponse) -> (Void)) {
        self.init()
        closure(self)
    }
    
}
