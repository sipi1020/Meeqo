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
    static let CHALLENGE_COIN = 40

    static let challenges = [
        Challenge(name: "Running", coin: Challenges.CHALLENGE_COIN, description: "Run", description2: "miles today", count:1),
        Challenge(name: "Pushup", coin: Challenges.CHALLENGE_COIN, description: "Do", description2: "pushups!", count: 10),
        Challenge(name: "Crunch", coin: Challenges.CHALLENGE_COIN, description: "Do", description2: "crunches!", count: 15),
        Challenge(name: "Squat", coin: Challenges.CHALLENGE_COIN, description: "Do", description2: "squats!", count: 15),
        Challenge(name: "Sport", coin: Challenges.CHALLENGE_COIN, description: "Do some sport for at least", description2: "minutes today!", count: 20),
        Challenge(name: "Walking", coin: Challenges.CHALLENGE_COIN, description: "Walk for", description2: "minutes today!", count: 20),
        Challenge(name: "Fruit", coin: Challenges.CHALLENGE_COIN, description: "Eat at least", description2: "piece of fruit today!", count: 1),
        Challenge(name: "Help someone", coin: Challenges.CHALLENGE_COIN, description: "Help someone", description2: "at least 1 times today", count: 1),
    ]
}

