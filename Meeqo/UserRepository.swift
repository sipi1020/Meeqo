//
//  UserManager.swift
//  Meeqo
//
//  Created by Livvit on 19/04/15.
//  Copyright (c) 2015 MyITSolver. All rights reserved.
//

import Foundation
import CoreData

class UserRepository {
    private var user = User()
    
    init() {
        
    }
    
    static var user:User?
    
    class func getUserCoinCount() -> Int {
        if let u = user {
            return Int(u.coins)
        } else {
            updateUserFromDb()
            return Int(user!.coins)
        }
    }
    class func getUserName() -> String {
        if let u = user {
            return u.name
        } else {
            updateUserFromDb()
            return user!.name
        }
    }
    class func getFacebookId() -> String {
        if let u = user {
            return u.facebookID
        } else {
            updateUserFromDb()
            return user!.facebookID
        }
    }
    class func update(user: User) {
        
    }
    class func updateUserFromDb() {
        let moc = AppDelegate.sharedAppDelegate.managedObjectContext!
        var error: NSError?
        let fetchRequest = NSFetchRequest(entityName:"User")
        if let u = moc.executeFetchRequest(fetchRequest, error: &error) as? [User] {
            user = u[0]
        } else {
            println("Could not load user from db")
            //todo: logout
            user = User()
            user?.coins = 100
            user?.name = "User"
            user?.facebookID = "123456789"
        }
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