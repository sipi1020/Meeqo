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
    let description2:NSString
    let count:Int
    var level = 1.0
    var completed = false
    
    init(name: NSString, coin:Int, description: NSString, description2: NSString, count:Int) {
        self.name = name
        self.coin = coin
        self.description = description
        self.count = count
        self.description2 = description2
    }
    
    
    
}

class TimeChallenge: Challenge {
    let timeInSeconds:Int
    init(name: NSString, coin:Int, description: NSString, description2: NSString, count: Int, time: Int) {
        self.timeInSeconds = time
        
        super.init(name: name, coin: coin, description: description, description2: description2, count: count)
    }
}