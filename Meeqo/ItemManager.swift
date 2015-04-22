//
//  ItemManager.swift
//  Meeqo
//
//  Created by Livvit on 19/04/15.
//  Copyright (c) 2015 MyITSolver. All rights reserved.
//

import Foundation
import CoreData


class ItemManager {
    static func buyCake() -> Bool {
        if UserRepository.spendMoney(ItemData.CAKE_PRICE) {
            let moc = AppDelegate.sharedAppDelegate.managedObjectContext!
            let entity =  NSEntityDescription.entityForName("MeeqoInventory",
                inManagedObjectContext:
                moc)
            
            
            AppDelegate.sharedAppDelegate.saveContext()
            return true
        } else {
            return false
        }
    }
}