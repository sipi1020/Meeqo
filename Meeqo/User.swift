//
//  User.swift
//  Meeqo
//
//  Created by Livvit on 19/04/15.
//  Copyright (c) 2015 MyITSolver. All rights reserved.
//

import Foundation
import CoreData

class User: NSManagedObject {

    @NSManaged var coins: NSNumber
    @NSManaged var facebookID: String
    @NSManaged var name: String

}
