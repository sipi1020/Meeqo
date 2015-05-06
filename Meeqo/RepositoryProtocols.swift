//
//  RepositoryProtocols.swift
//  Meeqo
//
//  Created by Livvit on 22/04/15.
//  Copyright (c) 2015 MyITSolver. All rights reserved.
//

import Foundation


protocol IUserRepository {
    func getUser() -> User
    func updateCurrentUser()
    func createNewUser()
    func spendMoney(price: Int) -> Bool
    func setParamsOfUser(name: String, facebookId: String)
}

protocol IMeeqoRepository {
    func create(color: String)
    func remove(meeqo: Meeqo)
    func getMeeqos() -> [Meeqo]
}

protocol IItemRepository {
    func getInventory() -> MeeqoInventory
    func updateCurrentInventory()
    func createNewInventory()
}
protocol IChallengeRepository {
}