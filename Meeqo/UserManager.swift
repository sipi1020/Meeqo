//
//  UserManager.swift
//  Meeqo
//
//  Created by Livvit on 19/04/15.
//  Copyright (c) 2015 MyITSolver. All rights reserved.
//

import Foundation

class UserManager {
    class func getUserCoinCount() -> Int {
        //TODO implement methid
        return 100
    }
    
    class func getUserName() -> String {
        return "Vikii"
    }
    class func getFacebookId() -> String {
        return "12345"
    }
    
    class func spendMoney(price: Int) -> Bool {
        if getUserCoinCount() < price {
            return false
        } else {
            //set new coin count
            return true
        }
    }
}