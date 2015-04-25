//
//  RepositoryHelper.swift
//  Meeqo
//
//  Created by Livvit on 25/04/15.
//  Copyright (c) 2015 MyITSolver. All rights reserved.
//

import Foundation

class RepositoryHelper {
    static func getBasicUser() -> User {
        var user = User()
        //user.
        user.name = "Viki"
        user.facebookID = "1234567890"
        user.coins = 100
        return user
    }
    
    static func getBasicInventory() -> MeeqoInventory {
        var i = MeeqoInventory()
        i.ball = true
        i.bear = false
        i.cake = false
        i.danceFloor = false
        i.icecream = false
        i.lollipop = false
        i.rope = false
        i.sleepingBear = false
        i.soundSystem = false
        i.trambulin = false
        i.treadmill = false
        i.videoGame = false
        i.weights = false
        
        return i
    }
}