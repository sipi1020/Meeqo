//
//  MeeqoManager.swift
//  Meeqo
//
//  Created by Livvit on 01/05/15.
//  Copyright (c) 2015 MyITSolver. All rights reserved.
//

import Foundation


class MeeqoManager {
    static let userRepo = RepositoryFactory.getUserRepository()
    static let itemRepo = RepositoryFactory.getItemRepository()
    static let meeqoRepo = RepositoryFactory.getMeeqoRepository()
    
    static func sleepMeeqo(meeqo: Meeqo) {
        meeqo.sleep = Int(meeqo.sleep) + MeeqoConstans.SLEEP_INCREASE
        meeqo.updateMe()
    }
    
    static func eatMeeqo(meeqo: Meeqo, foodValue: Int) {
        meeqo.food = Int(meeqo.food) + foodValue
        meeqo.updateMe()
    }
    
    static func playMeeqo(meeqo: Meeqo, playValue: Int) {
        meeqo.entertainment = Int(meeqo.entertainment) + playValue
        meeqo.updateMe()
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