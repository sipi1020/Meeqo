//
//  MeeqoManager.swift
//  Meeqo
//
//  Created by Livvit on 22/04/15.
//  Copyright (c) 2015 MyITSolver. All rights reserved.
//

import Foundation
import CoreData

class MeeqoRepository : IMeeqoRepository {
    private var meeqos = []
    
    init() {
        meeqos = getMeeqosFromDatabase()
    }
    
    func getMeeqos() -> [Meeqo] {
        return self.meeqos as! [Meeqo]
    }
    private func getMeeqosFromDatabase() -> [Meeqo] {
        let moc = AppDelegate.sharedAppDelegate.managedObjectContext!
        println("1")
        
        var error: NSError?
        let fetchRequest = NSFetchRequest(entityName:"Meeqo")
        println("1")
        if let meeqos = moc.executeFetchRequest(fetchRequest, error: &error) as? [Meeqo] {
            println("1")
            return meeqos
        } else {
            println("Could not fetch \(error)")
            return []
        }
    }
    
     func create(color: String) {
        let moc = AppDelegate.sharedAppDelegate.managedObjectContext!
        let entity =  NSEntityDescription.entityForName("Meeqo", inManagedObjectContext: moc)
        
        let m = Meeqo(entity: entity!, insertIntoManagedObjectContext: moc)
        m.entertainment = 100
        m.sleep = 100
        m.food = 100
        m.color = color
        
        
        AppDelegate.sharedAppDelegate.saveContext()
        let pentity =  NSEntityDescription.entityForName("MeeqoPosition",inManagedObjectContext: moc)
        let p = MeeqoPosition(entity: pentity!, insertIntoManagedObjectContext: moc)
        p.x = 100
        p.y = 100
        p.roomNumber = 4
        
        m.position = p
        /*let m = NSEntityDescription.insertNewObjectForEntityForName("Meeqo", inManagedObjectContext: moc) as! Meeqo
        m.setValue(100, forKey: "entertainment")
        m.setValue(100, forKey: "sleep")
        m.setValue(10, forKey: "food")*/
        
        AppDelegate.sharedAppDelegate.saveContext()
        meeqos = getMeeqosFromDatabase()
    }
    
    func remove(meeqo: Meeqo) {
        let moc = AppDelegate.sharedAppDelegate.managedObjectContext!
        moc.deleteObject(meeqo)
        AppDelegate.sharedAppDelegate.saveContext()
        meeqos = getMeeqosFromDatabase()
    }
    class func update(meeqo: Meeqo) {
        let moc = AppDelegate.sharedAppDelegate.managedObjectContext!
        moc.refreshObject(meeqo, mergeChanges: true)
        AppDelegate.sharedAppDelegate.saveContext()
    }
}