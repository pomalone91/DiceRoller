//
//  Die.swift
//  DiceRoller
//
//  Created by Paul Malone on 8/12/17.
//  Copyright © 2017 stroggi. All rights reserved.
//

import Foundation

//  The types of possible dice to be rolled
enum DieType {
    case d4, d6, d8, d10, d12, d20, d100
}

//  Structure defining components of dice, such as the total number of dice to be rolled, the type of dice to be rolled and the modifier added to the sum of the rolls
struct Die {
    var type: DieType = .d4
    var totalDice: Int = 1
    var modifier: Int = 0
    
    //  Add or remove 1 dice when button is tapped
    mutating func addDie() {
        self.totalDice += 1
        print(self.totalDice)
    }
    mutating func removeDie() {
        self.totalDice -= 1
        if totalDice < 1 {
            totalDice = 1
        }
        print(self.totalDice)
    }
    
    //  Add or subtract 1 from the modifier value to the roll
    mutating func addModifier() {
        self.modifier += 1
        print("modifier is: \(self.modifier)")
    }
    mutating func removeModifier() {
        self.modifier -= 1
        print("modifieris: \(self.modifier)")
    }
    
    //  Function to handle rolling the dice
    func rollDie() -> Int {
        let upperBound: UInt32
        switch type {
        case .d4:
            upperBound = 4
        case .d6:
            upperBound = 6
        case .d8:
            upperBound = 8
        case .d10:
            upperBound = 10
        case .d12:
            upperBound = 12
        case .d20:
            upperBound = 20
        case .d100:
            upperBound = 100
        }
        
        print("Rolled \(totalDice)\(type) + \(modifier)")
        
        //  Use upperBound determined from switch statement to set the max possible value created using arc4random_uniform()
        //  Could probably do this with some kind of loop
        var rollValue = UInt32()
        var i = totalDice
        while i > 0 {
            rollValue += arc4random_uniform(upperBound)
            i -= 1
        }
        return Int((rollValue)) + 1 + modifier
    }
}

