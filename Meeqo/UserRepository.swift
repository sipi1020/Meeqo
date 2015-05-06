//
//  UserManager.swift
//  Meeqo
//
//  Created by Livvit on 19/04/15.
//  Copyright (c) 2015 MyITSolver. All rights reserved.
//

import Foundation
import CoreData

class UserRepository : IUserRepository {
    private var user:User?
    
    init() {
        
    }
    
    func getUser() -> User {
        let moc = AppDelegate.sharedAppDelegate.managedObjectContext!
        println("2")
        
        var error: NSError?
        let fetchRequest = NSFetchRequest(entityName:"User")
        println("1")
        if let users = moc.executeFetchRequest(fetchRequest, error: &error) as? [User] {
            println("1")
            if users.count > 0 {
                user = users[0]
                return users[0]
            }
            println("There is no registered user")
        } else {
            println("Could not fetch \(error)")
        }
        createNewUser()
        return user!
    }
    
    func updateCurrentUser() {
        if let u = user {
            let moc = AppDelegate.sharedAppDelegate.managedObjectContext!
            moc.refreshObject(u, mergeChanges: true)
            AppDelegate.sharedAppDelegate.saveContext()
        }
    }
    
    func createNewUser() {
        let moc = AppDelegate.sharedAppDelegate.managedObjectContext!
        println("2")
        var error: NSError?
        let fetchRequest = NSFetchRequest(entityName:"User")
        println("1")
        if let users = moc.executeFetchRequest(fetchRequest, error: &error) as? [User] {
            println("1")
            for u in users {
                moc.deleteObject(u)
            }
            println("There is no registered user")
        } else {
            println("Could not fetch \(error)")
        }
        
        let entity =  NSEntityDescription.entityForName("User", inManagedObjectContext: moc)
        
        let u = User(entity: entity!, insertIntoManagedObjectContext: moc)
        u.name = "Viki"
        u.facebookID = "123456789"
        u.coins = 100
        user = u
        AppDelegate.sharedAppDelegate.saveContext()
    }
   /* class func getUserCoinCount() -> Int {
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

    */
    func spendMoney(price: Int) -> Bool {
        if Int(getUser().coins) > price {
            getUser().coins = Int(getUser().coins) - price
            updateCurrentUser()
            return true
        } else {
            return false
        }
    }
}