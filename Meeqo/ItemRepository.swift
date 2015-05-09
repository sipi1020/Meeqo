//
//  ItemRepository.swift
//  Meeqo
//
//  Created by Livvit on 22/04/15.
//  Copyright (c) 2015 MyITSolver. All rights reserved.
//

import Foundation
import CoreData
import UIKit


class ItemRepository : IItemRepository {
    private var meeqoInventory: MeeqoInventory?
    
    init() {
        
    }

    func getInventory() -> MeeqoInventory {
        let moc = AppDelegate.sharedAppDelegate.managedObjectContext!
        
        var error: NSError?
        let fetchRequest = NSFetchRequest(entityName:"MeeqoInventory")
        if let invs = moc.executeFetchRequest(fetchRequest, error: &error) as? [MeeqoInventory] {
            if invs.count > 0 {
                meeqoInventory = invs[0]
                return invs[0]
            }
            println("There is no registered user")
        } else {
            println("Could not fetch \(error)")
        }
        createNewInventory()
        return meeqoInventory!
    }
    
    func updateCurrentInventory() {
        if let i = meeqoInventory {
            let moc = AppDelegate.sharedAppDelegate.managedObjectContext!
            moc.refreshObject(i, mergeChanges: true)
            AppDelegate.sharedAppDelegate.saveContext()
        }
    }
    

    
    func createNewInventory() {
        let moc = AppDelegate.sharedAppDelegate.managedObjectContext!
        var error: NSError?
        let fetchRequest = NSFetchRequest(entityName:"User")
        if let users = moc.executeFetchRequest(fetchRequest, error: &error) as? [User] {
            for u in users {
                moc.deleteObject(u)
            }
            println("There is no registered user")
        } else {
            println("Could not fetch \(error)")
        }
        
        let entity =  NSEntityDescription.entityForName("MeeqoInventory", inManagedObjectContext: moc)
        
        let i = MeeqoInventory(entity: entity!, insertIntoManagedObjectContext: moc)
        i.ball = true
        i.bear = false
        i.cake = 0
        i.danceFloor = false
        i.icecream = 0
        i.lollipop = 0
        i.rope = false
        i.sleepingBear = false
        i.soundSystem = false
        i.trambulin = false
        i.treadmill = false
        i.videoGame = false
        i.weights = false
        
        //TODO: set params of U
        AppDelegate.sharedAppDelegate.saveContext()
        meeqoInventory = i
    }
}