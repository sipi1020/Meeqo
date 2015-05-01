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
    
    func toJson() -> String {
        var json = "{}"
        return json
    }
}
