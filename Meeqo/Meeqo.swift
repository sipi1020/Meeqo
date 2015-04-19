//
//  Meeqo.swift
//  Meeqo
//
//  Created by Livvit on 19/04/15.
//  Copyright (c) 2015 MyITSolver. All rights reserved.
//

import Foundation
import CoreData

class Meeqo: NSManagedObject {

    @NSManaged var entertainment: NSNumber
    @NSManaged var food: NSNumber
    @NSManaged var sleep: NSNumber
    @NSManaged var position: MeeqoPosition

}
