//
//  UserModel.swift
//  Meeqo
//
//  Created by Livvit on 01/05/15.
//  Copyright (c) 2015 MyITSolver. All rights reserved.
//

import Foundation


class UserModel {
    let user:User
    let meeqos:[Meeqo]
    let inventory:MeeqoInventory
    
    init(user: User, meeqos: [Meeqo], inventory: MeeqoInventory) {
        self.user = user
        self.meeqos = meeqos
        self.inventory = inventory
    }
    
    /*func toJson() -> String {
        
        var dateFor: NSDateFormatter = NSDateFormatter()
        dateFor.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
        
       var json = "{\"user\": { \"coins\": \"\(user.coins)\", \"facebookID\": \"\(user.facebookID)\", \"lastDayChallenged\": \"\(dateFor.stringFromDate( user.lastDayChallenged))\", \"lastUpdatedMeeqos\": \"\(dateFor.stringFromDate( user.lastUpdatedMeeqos))\", \"name\": \"\(user.name)\" }, \"inventory\":{ \"ball\": \"\(inventory.ball)\", \"bear\": \"\(inventory.bear)\", \"cake\": \"\(inventory.cake)\", \"danceFloor\": \"\(inventory.danceFloor)\", \"icecream\": \"\(inventory.icecream)\", \"lollipop\": \"\(inventory.lollipop)\", \"rope\": \"\(inventory.rope)\", \"sleepingBear\": \"\(inventory.sleepingBear)\", \"soundSystem\": \"\(inventory.soundSystem)\", \"trambulin\": \"\(inventory.trambulin)\", \"treadmill\": \"\(inventory.treadmill)\", \"videoGame\": \"\(inventory.videoGame)\", \"weights\": \"\(inventory.weights)\" }, \"meeqos\":[\(UserModel.meeqosToJSONArray( meeqos))] } "
        
        println("\(json)")
        return json
    }*/
    
    static func meeqoToJSON(meeqo: Meeqo) -> String {
        return "{\"entertainment\":\"\(meeqo.entertainment)\", \"food\":\"\(meeqo.food)\", \"sleep\":\"\(meeqo.sleep)\", \"color\":\"\(meeqo.color)\", \"position\": {\"x\": \"\(meeqo.position.x)\", \"y\": \"\(meeqo.position.y)\", \"roomNumber\": \"\(meeqo.position.roomNumber)\" } }"
    }
    
    static func meeqosToJSONArray(meeqos: [Meeqo]) -> NSString {
        var result: NSString = ""
        var count = 0
        for m in meeqos {
            
            if count == 0 {
                result = meeqoToJSON(m)
                continue
            }
            result = "\(result), \(meeqoToJSON(m))"
        }
        return result
    }
    
    static func jsonToUserModel(jsonString: NSString) {
        if let dataFromString = jsonString.dataUsingEncoding(NSUTF8StringEncoding, allowLossyConversion: false) {
            let json = JSON(data: dataFromString)
            
            var str = json["user"]
            println("Trial \(str)")
        }
    }
}