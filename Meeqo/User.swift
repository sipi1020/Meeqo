//
//  User.swift
//  Meeqo
//
//  Created by Livvit on 22/04/15.
//  Copyright (c) 2015 MyITSolver. All rights reserved.
//

import Foundation
import CoreData

@objc(User)
class User: NSManagedObject {

    @NSManaged var coins: NSNumber
    @NSManaged var facebookID: String
    @NSManaged var name: String

}
