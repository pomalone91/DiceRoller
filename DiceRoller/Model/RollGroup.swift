//
//  RollGroup.swift
//  DiceRoller
//
//  Created by Paul Malone on 6/13/18.
//  Copyright © 2018 stroggi. All rights reserved.
//

import Foundation

class RollGroup {
    var groupName: String
    var rolls: [Die]
    
    // Initialize with empty rolls
    init(_ groupName: String) {
        self.groupName = groupName
        self.rolls = []
    }
    
    // Initialize with given array of rolls
    init(_ groupName: String, rolls: [Die]) {
        self.groupName = groupName
        self.rolls = rolls
    }
    
    func addDie(with sides: Int, totalDice: Int, modifier: Int, name: String) {
        rolls.append(Die(sides: sides, totalDice: totalDice, modifier: modifier, name: name))
    }
    
    func removeDieWhere(_ indexPath: Int) {
        rolls.remove(at: indexPath)
    }
}
