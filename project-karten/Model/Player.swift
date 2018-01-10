//
//  Colors.swift
//  project-karten
//
//  Created by Barbara Kudiess on 12/1/17.
//  Copyright © 2017 SpaceWalk. All rights reserved.
//

import UIKit

class Player: NSObject, NSCoding{
    
    let userName: String
    var userScore: Int
    var userGear: Int
    var userLevel: Int
    var userOneShot: Int
    let userColor: Int
    
    init(name: String, score: Int, gear: Int, level: Int, oneShot: Int, color: Int) {
        userColor = color
        userScore = score
        userGear = gear
        userLevel = level
        userOneShot = oneShot
        userName = name
    }
    
    required init(coder aDecoder: NSCoder) {
        userName = aDecoder.decodeObject(forKey: "userName") as? String ?? "Player"
        userScore = aDecoder.decodeInteger(forKey: "userScore")
        userGear = aDecoder.decodeInteger(forKey: "userGear")
        userLevel = aDecoder.decodeInteger(forKey: "userLevel")
        userOneShot = aDecoder.decodeInteger(forKey: "userOneShot")
        userColor = aDecoder.decodeInteger(forKey: "userColor")
    }
    
    func encode(with coder: NSCoder) {
        coder.encode(userName, forKey: "userName")
        coder.encode(userScore, forKey: "userScore")
        coder.encode(userGear, forKey: "userGear")
        coder.encode(userLevel, forKey: "userLevel")
        coder.encode(userOneShot, forKey: "userOneShot")
        coder.encode(userColor, forKey: "userColor")
    }
    
}
