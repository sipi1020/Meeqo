//
//  RepositoryFactory.swift
//  Meeqo
//
//  Created by Livvit on 22/04/15.
//  Copyright (c) 2015 MyITSolver. All rights reserved.
//

import Foundation

class RepositoryFactory {
    static let userRepository = UserRepository()
    static let itemRepository = ItemRepository()
    static let meeqoRepository = MeeqoRepository()
    
    static func getUserRepository() -> IUserRepository {
        return userRepository
    }
    
    static func getMeeqoRepository() -> MeeqoRepository {
        return meeqoRepository
    }
    
    static func getItemRepository() -> ItemRepository {
        return itemRepository 
    }
}