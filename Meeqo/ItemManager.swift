//
//  ItemManager.swift
//  Meeqo
//
//  Created by Livvit on 19/04/15.
//  Copyright (c) 2015 MyITSolver. All rights reserved.
//

import Foundation
import CoreData
import UIKit

class ItemManager {
    static let userRepo = RepositoryFactory.getUserRepository()
    static let itemRepo = RepositoryFactory.getItemRepository()
    static let meeqoRepo = RepositoryFactory.getMeeqoRepository()
    
    static func getMeeqoInventory() -> MeeqoInventory {
        return itemRepo.getInventory()
    }
    
    static func buyCake() -> Bool {
            if  userRepo.spendMoney(ItemData.CAKE_PRICE) {
                itemRepo.getInventory().cake = Int(itemRepo.getInventory().cake) + 1
                itemRepo.updateCurrentInventory()
                return true
            }
        
        return false
    }
    static func buyIceCream() -> Bool {
        if  userRepo.spendMoney(ItemData.ICECREAM_PRICE) {
            itemRepo.getInventory().icecream = Int(itemRepo.getInventory().icecream) + 1
            itemRepo.updateCurrentInventory()
            return true
        }
        
        return false
    }
    static func buyLollipop() -> Bool {
        if  userRepo.spendMoney(ItemData.LOLLIPOP_PRICE) {
            itemRepo.getInventory().lollipop = Int(itemRepo.getInventory().lollipop) + 1
            itemRepo.updateCurrentInventory()
            return true
        }
        
        return false
    }
    static func buyBear() -> Bool {
        if !Bool(itemRepo.getInventory().bear) {
            if  userRepo.spendMoney(ItemData.BEAR_PRICE) {
                itemRepo.getInventory().bear = NSNumber(bool: true)
                itemRepo.updateCurrentInventory()
                return true
            }
        }
        return false
    }
    static func buyBall() -> Bool {
        if !Bool(itemRepo.getInventory().ball) {
            if  userRepo.spendMoney(ItemData.BALL_PRICE) {
                itemRepo.getInventory().ball = NSNumber(bool: true)
                itemRepo.updateCurrentInventory()
                return true
            }
        }
        return false
    }
    static func buyDanceFloor() -> Bool {
        if !Bool(itemRepo.getInventory().danceFloor) {
            if  userRepo.spendMoney(ItemData.DANCE_FLOOR_PRICE) {
                itemRepo.getInventory().danceFloor = NSNumber(bool: true)
                itemRepo.updateCurrentInventory()
                return true
            }
        }
        return false
    }
    static func buyRope() -> Bool {
        if !Bool(itemRepo.getInventory().rope) {
            if  userRepo.spendMoney(ItemData.ROPE_PRICE) {
                itemRepo.getInventory().sleepingBear = NSNumber(bool: true)
                itemRepo.updateCurrentInventory()
                return true
            }
        }
        return false
    }
    static func buySleepingBear() -> Bool {
        if !Bool(itemRepo.getInventory().sleepingBear) {
            if  userRepo.spendMoney(ItemData.SLEEPING_BEAR_PRICE) {
                itemRepo.getInventory().sleepingBear = NSNumber(bool: true)
                itemRepo.updateCurrentInventory()
                return true
            }
        }
        return false
    }
    static func buySoundSystem() -> Bool {
        if !Bool(itemRepo.getInventory().soundSystem) {
            if  userRepo.spendMoney(ItemData.SOUND_SYSTEM_PRICE) {
                itemRepo.getInventory().soundSystem = NSNumber(bool: true)
                itemRepo.updateCurrentInventory()
                return true
            }
        }
        return false
    }
    static func buyTrambulin() -> Bool {
        if !Bool(itemRepo.getInventory().trambulin) {
            if  userRepo.spendMoney(ItemData.TRAMBULIN_PRICE) {
                itemRepo.getInventory().trambulin = NSNumber(bool: true)
                itemRepo.updateCurrentInventory()
                return true
            }
        }
        return false
    }
    static func buyTreadmill() -> Bool {
        if !Bool(itemRepo.getInventory().treadmill) {
            if  userRepo.spendMoney(ItemData.TREADMILL_PRICE) {
                itemRepo.getInventory().treadmill = NSNumber(bool: true)
                itemRepo.updateCurrentInventory()
                return true
            }
        }
        return false
    }
    static func buyVideoGames() -> Bool {
        if !Bool(itemRepo.getInventory().videoGame) {
            if  userRepo.spendMoney(ItemData.VIDEO_GAMES_PRICE) {
                itemRepo.getInventory().videoGame = NSNumber(bool: true)
                itemRepo.updateCurrentInventory()
                return true
            }
        }
        return false
    }
    static func buyWeights() -> Bool {
        if !Bool(itemRepo.getInventory().weights) {
            if  userRepo.spendMoney(ItemData.WEIGHTS_PRICE) {
                itemRepo.getInventory().weights = NSNumber(bool: true)
                itemRepo.updateCurrentInventory()
                return true
            }
        }
        return false
    }
    static func getFoodIcons() -> [UIImage]{
        var images = [UIImage(named: "lollipop_icon")!,UIImage(named: "icecream_icon")!,UIImage(named: "cake_icon")! ]
        return images
    }
    
    static func getToyIcons() -> [UIImage]{
        var images = [UIImage(named: "balls_icon")!,UIImage(named: "rope_icon")!,UIImage(named: "weights_icon")! ,UIImage(named: "bear_icon")!,UIImage(named: "sleepingbear_icon")!,UIImage(named: "trambulin_icon")!,UIImage(named: "soundsystem_icon")!,UIImage(named: "treadmill_icon")!,UIImage(named: "dancefloor_icon")!,UIImage(named: "videogame_icon")!]
        return images
    }
    
    static func getToyTitles() -> [String]{
        var toys = ["Balls","Rope","Weights","Teddy bear","Teddy bear for sleep","Trampoline","Sound system","Treadmill","Dancefloor","Video game"]
        return toys
    }
    
    static func getToyPrices() -> [Int]{
        var toys = [ItemData.BALL_PRICE,ItemData.ROPE_PRICE,ItemData.WEIGHTS_PRICE,ItemData.BEAR_PRICE,ItemData.SLEEPING_BEAR_PRICE,ItemData.TRAMBULIN_PRICE,ItemData.SOUND_SYSTEM_PRICE,ItemData.TREADMILL_PRICE,ItemData.DANCE_FLOOR_PRICE,ItemData.VIDEO_GAMES_PRICE]
        return toys
    }
    
    static func getToyState () ->[Bool]{
        let meeqoInventory = ItemManager.getMeeqoInventory()
        var toys = [meeqoInventory.ball as Bool, meeqoInventory.rope as Bool,meeqoInventory.weights as Bool,meeqoInventory.bear as Bool,meeqoInventory.sleepingBear as Bool,meeqoInventory.trambulin as Bool,meeqoInventory.soundSystem as Bool,meeqoInventory.danceFloor as Bool,meeqoInventory.treadmill as Bool,meeqoInventory.videoGame as Bool]
        return toys
    }
    
    static func getFoodPrices() -> [Int]{
        var foods = [ItemData.LOLLIPOP_PRICE,ItemData.ICECREAM_PRICE,ItemData.CAKE_PRICE]
        return foods
    }
    
    static func getFoodCount() -> [Int]{
        let meeqoInventory = ItemManager.getMeeqoInventory()
        var foods = [meeqoInventory.lollipop as Int,meeqoInventory.icecream as Int,meeqoInventory.cake as Int]
        return foods
    }
    
    static func getFoodTitles() -> [String] {
        var foods = ["Lollipop","Icecream","Cake"] as [String]
        return foods
    }
}