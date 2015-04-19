//
//  RawDataObjects.swift
//  Meeqo
//
//  Created by Livvit on 19/04/15.
//  Copyright (c) 2015 MyITSolver. All rights reserved.
//

import Foundation

class Challenges {

    static var challenges = Array<Challenge>()
    
    static func loadChallenges() {
        challenges.removeAll(keepCapacity: false)
        
        challenges.append(TimeChallenge(name: "Push ups", coin: 13, description: "Make 10 push ups today.", timeInSecond: 120))
        challenges.append(TimeChallenge(name: "Running", coin: 20, description: "Run today for 300 secounds!", timeInSecond: 300))
        challenges.append(Challenge(name: "Eating", coin: 13, description: "Eat at least one chocolate bar!"))
    }
}

class ItemData {
    static let CAKE_PRICE = 10
}