//
//  Meeqo.swift
//  Meeqo
//
//  Created by Livvit on 22/04/15.
//  Copyright (c) 2015 MyITSolver. All rights reserved.
//

import Foundation
import CoreData

@objc(Meeqo)
class Meeqo: NSManagedObject {

    @NSManaged var entertainment: NSNumber
    @NSManaged var food: NSNumber
    @NSManaged var sleep: NSNumber
    @NSManaged var color: String
    @NSManaged var position: MeeqoPosition
    
    func updateMe() {
        MeeqoRepository.update(self)
    }

}
