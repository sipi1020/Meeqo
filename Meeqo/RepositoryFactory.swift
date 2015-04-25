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
    
    static func getUserRepository() -> IUserRepository {
        return userRepository
    }
}