//
//  Challenge.swift
//  Meeqo
//
//  Created by Livvit on 30/04/15.
//  Copyright (c) 2015 MyITSolver. All rights reserved.
//

import Foundation


@objc(Challenge)
class Challenge {
    let name:NSString
    let coin:Int
    let description:NSString
    var level = 1.0
    var completed = false
    
    init(name: NSString, coin:Int, description: NSString) {
        self.name = name
        self.coin = coin
        self.description = description
    }
    
    
    
}

class TimeChallenge: Challenge {
    let timeInSeconds:Int
    init(name: NSString, coin:Int, description: NSString, time: Int) {
        self.timeInSeconds = time
        
        super.init(name: name, coin: coin, description: description)
    }
}