//
//  PayOnline3DSData.swift
//  Payonline
//
//  Created by Zhanserik on 10/10/16.
//  Copyright © 2016 Kenes Inc. All rights reserved.
//

import UIKit

/**
 * Информация, возвращаемая платежной системой, для прохождения проверки на стороне банка-эмитента
 */
class PayOnline3DSData: NSObject {
    /** Запрос на аутентификацию плательщика */
    var pareq: String?
    /** Страница сайта банка-эмитента */
    var acsurl: String?
    /** Информация о мерчанте */
    var pd: String?
    /** */
    var transactionId: Int?
    /** */
    var md: String? {
        guard let transactionId = transactionId,
            let pd = pd else {
            return nil
        }
        return "\(transactionId);\(pd)"
    }
    
    convenience init(closure: (PayOnline3DSData) -> (Void)) {
        self.init()
        closure(self)
    }
}
