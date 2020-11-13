//
//  History.swift
//  WeCash
//
//  Created by knight on 10/8/20.
//

import Foundation

class History {
    var phonenumber: String
    var amount: String
    var email: String?
    
    init(phonenumber: String, amount: String, email: String) {
        self.phonenumber = phonenumber
        self.amount = amount
        self.email = amount
    }
}
