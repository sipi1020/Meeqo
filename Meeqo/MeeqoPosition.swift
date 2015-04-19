//
//  MeeqoPosition.swift
//  Meeqo
//
//  Created by Livvit on 19/04/15.
//  Copyright (c) 2015 MyITSolver. All rights reserved.
//

import Foundation
import CoreData

class MeeqoPosition: NSManagedObject {

    @NSManaged var roomNumber: NSNumber
    @NSManaged var x: NSNumber
    @NSManaged var y: NSNumber
    @NSManaged var meeqo: Meeqo

}
