//
//  Raw.swift
//  Meeqo
//
//  Created by Livvit on 22/04/15.
//  Copyright (c) 2015 MyITSolver. All rights reserved.
//

import Foundation

class MeeqoConstans {
    //not set
    static let FOOD_DECREES_PER_HOUR = 1
    static let PLAY_DECREES_PER_HOUR = 1
    static let SLEEP_DECREES_PER_HOUR = 1
    
    static let SLEEP_INCREASE = 100
}

class ItemData {
    static let CAKE_PRICE:Int = 30
    static let BEAR_PRICE:Int = 700
    static let BALL_PRICE:Int = 400
    static let DANCE_FLOOR_PRICE:Int = 1200
    static let ICECREAM_PRICE:Int = 20
    static let LOLLIPOP_PRICE:Int = 10
    static let ROPE_PRICE:Int = 500
    static let SLEEPING_BEAR_PRICE:Int = 800
    static let SOUND_SYSTEM_PRICE:Int = 1000
    static let TRAMBULIN_PRICE:Int = 900
    static let TREADMILL_PRICE:Int = 1100
    static let VIDEO_GAMES_PRICE:Int = 1500
    static let WEIGHTS_PRICE:Int = 500
    
    //not set
    static let CAKE_FOOD_VALUE:Int = 80
    static let BEAR_FOOD_VALUE:Int = 45
    static let BALL_FOOD_VALUE:Int = 30
    static let DANCE_FLOOR_FOOD_VALUE:Int = 70
    static let ICECREAM_FOOD_VALUE:Int = 50
    static let LOLLIPOP_FOOD_VALUE:Int = 20
    static let ROPE_FOOD_VALUE:Int = 35
    static let SLEEPING_BEAR_FOOD_VALUE:Int = 50
    static let SOUND_SYSTEM_FOOD_VALUE:Int = 60
    static let TRAMBULIN_FOOD_VALUE:Int = 55
    static let TREADMILL_FOOD_VALUE:Int = 65
    static let VIDEO_GAMES_FOOD_VALUE:Int = 75
    static let WEIGHTS_FOOD_VALUE:Int = 40
    
    static let ORANGE_MEEQO_PRICE = 400
    static let PURPLE_MEEQO_PRICE = 500
    static let PINK_MEEQO_PRICE = 600
    static let GREEN_MEEQO_PRICE = 900
    static let RED_MEEQO_PRICE = 1400
    static let BLUE_MEEQO_PRICE = 1000
    static let BLACK_MEEQO_PRICE = 1200
    static let RAINBOW_MEEQO_PRICE = 2000
    
}

class Challenges {
    static let EASY_CHALLENGE_COIN = 100
    static let MEDIUM_CHALLENGE_COIN = 200
    static let HARD_CHALLENGE_COIN = 300
    static let challenges = [
        Challenge(name: "Running", coin: Challenges.EASY_CHALLENGE_COIN, description: "Run 1 mile today"),
        Challenge(name: "Pushup", coin: Challenges.EASY_CHALLENGE_COIN, description: "Make 20 pushups!")
    ]
}

