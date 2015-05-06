//
//  ChallengeManager.swift
//  Meeqo
//
//  Created by Livvit on 26/04/15.
//  Copyright (c) 2015 MyITSolver. All rights reserved.
//

import Foundation

class ChallengeManager {
    static func getRandomChallenge() -> Challenge? {
        let num = arc4random_uniform(UInt32(Challenges.challenges.count - 1))
        return Challenges.challenges[Int(num)]
    }
    static func updateChallengeDataBaseFromServer() {
        //TODO: implement method
    }
}