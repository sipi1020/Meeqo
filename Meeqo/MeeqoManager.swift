//
//  MeeqoManager.swift
//  Meeqo
//
//  Created by Livvit on 01/05/15.
//  Copyright (c) 2015 MyITSolver. All rights reserved.
//

import Foundation
import UIKit

class MeeqoManager {
    static let userRepo = RepositoryFactory.getUserRepository()
    static let itemRepo = RepositoryFactory.getItemRepository()
    static let meeqoRepo = RepositoryFactory.getMeeqoRepository()
    
   
    static func getMeeqoIcons() -> [UIImage]{
        var images = [UIImage(named: "narancs")!,UIImage(named: "lila")!,UIImage(named: "rozsaszin")! ,UIImage(named: "zold")!, UIImage(named: "kek")!,UIImage(named: "fekete")!,UIImage(named: "piros")! ,UIImage(named: "szivarvany")!]
        return images
    }
    
    static func sleepMeeqo(meeqo: Meeqo) {
        if Int(meeqo.sleep) + MeeqoConstans.SLEEP_INCREASE <= 100 {
        meeqo.sleep = Int(meeqo.sleep) + MeeqoConstans.SLEEP_INCREASE
        }
        else{
            meeqo.sleep = 100
        }
        meeqo.updateMe()
    }
    
    static func eatMeeqo(meeqo: Meeqo, foodValue: Int) ->Bool {
        if Int(itemRepo.getInventory().cake) > 0 && foodValue == ItemData.CAKE_FOOD_VALUE{
            if (Int(meeqo.food) + foodValue) <= 100 {
            meeqo.food = Int(meeqo.food) + foodValue
            }
            else {
                meeqo.food = 100
            }
            return true
        }
        if Int(itemRepo.getInventory().lollipop) > 0 && foodValue == ItemData.LOLLIPOP_FOOD_VALUE{
            if (Int(meeqo.food) + foodValue) <= 100 {
                meeqo.food = Int(meeqo.food) + foodValue
            }
            else {
                meeqo.food = 100
            }
            return true
        }
        if Int(itemRepo.getInventory().icecream) > 0 && foodValue == ItemData.ICECREAM_FOOD_VALUE{
            if (Int(meeqo.food) + foodValue) <= 100 {
                meeqo.food = Int(meeqo.food) + foodValue
            }
            else {
                meeqo.food = 100
            }
            return true
        }
        meeqo.updateMe()
        return false
    }
    static func getMeeqoColorName() -> [String] {
        var colors = ["narancs","lila","rozsaszin","zold","kek","fekete","piros","szivarvany"]
        return colors
    }
    
    static func playMeeqo(meeqo: Meeqo, playValue: Int) ->Bool{
        if Bool(ItemManager.itemRepo.getInventory().ball) && playValue == ItemData.BALL_FOOD_VALUE {
            if (Int(meeqo.entertainment) + playValue) <= 100 {
            meeqo.entertainment = Int(meeqo.entertainment) + playValue
            }
            else {
                meeqo.entertainment = 100
            }
            return true
        }
        if Bool(ItemManager.itemRepo.getInventory().rope) && playValue == ItemData.ROPE_FOOD_VALUE {
            if (Int(meeqo.entertainment) + playValue) <= 100 {
                meeqo.entertainment = Int(meeqo.entertainment) + playValue
            }
            else {
                meeqo.entertainment = 100
            }
            return true
        }
        if Bool(ItemManager.itemRepo.getInventory().weights) && playValue == ItemData.WEIGHTS_FOOD_VALUE {
            if (Int(meeqo.entertainment) + playValue) <= 100 {
                meeqo.entertainment = Int(meeqo.entertainment) + playValue
            }
            else {
                meeqo.entertainment = 100
            }
            return true
        }
        if Bool(ItemManager.itemRepo.getInventory().bear) && playValue == ItemData.BEAR_FOOD_VALUE {
            if (Int(meeqo.entertainment) + playValue) <= 100 {
                meeqo.entertainment = Int(meeqo.entertainment) + playValue
            }
            else {
                meeqo.entertainment = 100
            }
            return true
        }
        if Bool(ItemManager.itemRepo.getInventory().sleepingBear) && playValue == ItemData.SLEEPING_BEAR_FOOD_VALUE {
            if (Int(meeqo.entertainment) + playValue) <= 100 {
                meeqo.entertainment = Int(meeqo.entertainment) + playValue
            }
            else {
                meeqo.entertainment = 100
            }
            return true
        }
        if Bool(ItemManager.itemRepo.getInventory().trambulin) && playValue == ItemData.TRAMBULIN_FOOD_VALUE {
            if (Int(meeqo.entertainment) + playValue) <= 100 {
                meeqo.entertainment = Int(meeqo.entertainment) + playValue
            }
            else {
                meeqo.entertainment = 100
            }
            return true
        }
        if Bool(ItemManager.itemRepo.getInventory().soundSystem) && playValue == ItemData.SOUND_SYSTEM_FOOD_VALUE {
            if (Int(meeqo.entertainment) + playValue) <= 100 {
                meeqo.entertainment = Int(meeqo.entertainment) + playValue
            }
            else {
                meeqo.entertainment = 100
            }
            return true
        }
        if Bool(ItemManager.itemRepo.getInventory().treadmill) && playValue == ItemData.TREADMILL_FOOD_VALUE {
            if (Int(meeqo.entertainment) + playValue) <= 100 {
                meeqo.entertainment = Int(meeqo.entertainment) + playValue
            }
            else {
                meeqo.entertainment = 100
            }
            return true
        }
        if Bool(ItemManager.itemRepo.getInventory().danceFloor) && playValue == ItemData.DANCE_FLOOR_FOOD_VALUE {
            if (Int(meeqo.entertainment) + playValue) <= 100 {
                meeqo.entertainment = Int(meeqo.entertainment) + playValue
            }
            else {
                meeqo.entertainment = 100
            }
            return true
        }
        if Bool(ItemManager.itemRepo.getInventory().videoGame) && playValue == ItemData.VIDEO_GAMES_FOOD_VALUE {
            if (Int(meeqo.entertainment) + playValue) <= 100 {
                meeqo.entertainment = Int(meeqo.entertainment) + playValue
            }
            else {
                meeqo.entertainment = 100
            }
            return true
        }
        
        meeqo.updateMe()
        return false
    }
    static func getMeeqoPrices()->[Int] {
        var prices = [ItemData.ORANGE_MEEQO_PRICE,ItemData.PURPLE_MEEQO_PRICE,ItemData.PINK_MEEQO_PRICE,ItemData.GREEN_MEEQO_PRICE,ItemData.BLUE_MEEQO_PRICE,ItemData.BLUE_MEEQO_PRICE,ItemData.RED_MEEQO_PRICE,ItemData.RAINBOW_MEEQO_PRICE]
        return prices
    }
    
    
    static func getMeeqoTitles() -> [String] {
        var colors = ["Orange","Purple","Pink","Green","Blue","Black","Red","Rainbow"]
        return colors
        
    }
    
    static func buyMeeqo(color: String) -> Bool {
        switch color {
        case "szivarvany":
            return buyMeeqo(color, price: ItemData.RAINBOW_MEEQO_PRICE)
            
        case "piros":
            return buyMeeqo(color, price: ItemData.RED_MEEQO_PRICE)
            
        case "fekete":
            return buyMeeqo(color, price: ItemData.BLACK_MEEQO_PRICE)
            
        case "kek":
            return buyMeeqo(color, price: ItemData.BLUE_MEEQO_PRICE)
            
        case "zold":
            return buyMeeqo(color, price: ItemData.GREEN_MEEQO_PRICE)
            
        case "rozsaszin":
            return buyMeeqo(color, price: ItemData.PINK_MEEQO_PRICE)
            
        case "narancs":
            return buyMeeqo(color, price: ItemData.ORANGE_MEEQO_PRICE)
            
        case "lila":
            return buyMeeqo(color, price: ItemData.PURPLE_MEEQO_PRICE)
            
        default:
                break
        }
        return false
    }
    
    private static func buyMeeqo(color: String, price: Int) -> Bool {
        if userRepo.spendMoney(price) {
            meeqoRepo.create(color)
            return true
        }
        return false
        
    }
    static func getMeeqos() -> [Meeqo] {
        return meeqoRepo.getMeeqos()
    }
}