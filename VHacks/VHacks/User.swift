//
//  User.swift
//  VHacks
//
//  Created by Abha Vedula on 3/9/18.
//  Copyright © 2018 VHacks. All rights reserved.
//

import Foundation

class User {
    var name: String
    var username: String
    var password: String
    var tokens: Int
    
    
    init(name: String, username: String, password: String, tokens: Int) {
        self.name = name
        self.username = username
        self.password = password
        self.tokens = tokens
    }
    
    func getTokens(amount: Int) {
       tokens = tokens + amount
    }
    
    func pay(cost: Int) {
        tokens = tokens - cost
    }
    
  
}
