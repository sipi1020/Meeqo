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
    static let EAT_TIME_PERIOD = 1   //every hour decrees the eat property of meeqo
    static let PLAY_TIME_PERIOD = 1
    static let SLEEP_TIME_PERIOD = 1
    
    static let SLEEP_INCREASE = 1
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
    static let CAKE_FOOD_VALUE:Int = 16
    static let BEAR_FOOD_VALUE:Int = 100
    static let BALL_FOOD_VALUE:Int = 100
    static let DANCE_FLOOR_FOOD_VALUE:Int = 100
    static let ICECREAM_FOOD_VALUE:Int = 8
    static let LOLLIPOP_FOOD_VALUE:Int = 4
    static let ROPE_FOOD_VALUE:Int = 100
    static let SLEEPING_BEAR_FOOD_VALUE:Int = 100
    static let SOUND_SYSTEM_FOOD_VALUE:Int = 100
    static let TRAMBULIN_FOOD_VALUE:Int = 100
    static let TREADMILL_FOOD_VALUE:Int = 100
    static let VIDEO_GAMES_FOOD_VALUE:Int = 100
    static let WEIGHTS_FOOD_VALUE:Int = 100
    
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
    static let challenges = [
        Challenge(name: "Running", coin: 22, description: "Run 1 mile today"),
        Challenge(name: "Pushup", coin: 20, description: "Make 20 pushups!")
    ]
}

