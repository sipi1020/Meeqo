//
//  Challenge.swift
//  Meeqo
//
//  Created by Patrik on 4/17/15.
//  Copyright (c) 2015 MyITSolver. All rights reserved.
//

import Foundation

class Challenge {
    let name:NSString
    let coin:Int
    let description:NSString
    var completed = false
    
    init(name: NSString, coin:Int, description:NSString) {
        self.name = name
        self.coin = coin
        self.description = description
    }
}

class TimeChallenge : Challenge {
    let timeInSecond:Int
    init(name: NSString, coin:Int, description:NSString, timeInSecond:Int) {
        self.timeInSecond = timeInSecond
        super.init(name: name, coin: coin, description: description)
    }
}
