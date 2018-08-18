//
//  Die.swift
//  DiceRoller
//
//  Created by Paul Malone on 8/12/17.
//  Copyright © 2017 stroggi. All rights reserved.
//

import Foundation

/*** The types of possible dice to be rolled ***/
enum DieType {
    case d4, d6, d8, d10, d12, d20, d100
}

/*** Structure defining components of dice, such as the total number of dice to be rolled.
 *** The type of dice to be rolled and the modifier added to the sum of the rolls ***/
class Die: CustomStringConvertible {
    var sides: Int
    var totalDice: Int = 1
    var modifier: Int = 0
    var name: String?
    var description: String {
        let roll: String
        if let name = self.name {
            if self.modifier < 0 {
                roll = "\(name): \(self.totalDice)d\(self.sides)\(self.modifier)"
            } else {
                roll = "\(name): \(self.totalDice)d\(self.sides)+\(self.modifier)"
            }
        } else {
            if self.modifier < 0 {
                roll = "\(self.totalDice)d\(self.sides)\(self.modifier)"
            } else {
                roll = "\(self.totalDice)d\(self.sides)+\(self.modifier)"
            }
        }
        return roll
    }
    
    // init without name
    init(sides: Int, totalDice: Int, modifier: Int) {
        self.sides = sides
        self.totalDice = totalDice
        self.modifier = modifier
    }
    
    // init with name
    init(sides: Int, totalDice: Int, modifier: Int, name: String) {
        self.sides = sides
        self.totalDice = totalDice
        self.modifier = modifier
        self.name = name
    }
    
    /*** Add or remove 1 dice when button is tapped
     *** If the number of die exceeds the maximum of 99, it resets to 1
     *** If the total number of die is 1 and one is subtracted, it resets to the max, 99, 
     ***/
    func addDie() {
        self.totalDice += 1
        print(self.totalDice)
        if totalDice > 99 {
            totalDice = 1
        }
    }
    func removeDie() {
        self.totalDice -= 1
        if totalDice < 1 {
            totalDice = 99
        }
        print(self.totalDice)
    }
    
    //  Add or subtract 1 from the modifier value to the roll
    func addModifier() {
        self.modifier += 1
        if modifier > 99 {
            self.modifier = -99
        }
        print("modifier is: \(self.modifier)")
    }
    func removeModifier() {
        self.modifier -= 1
        if modifier < -99 {
            self.modifier = 99
        }
        print("modifieris: \(self.modifier)")
    }
    
    // Function to reset modifiers and total dice
    func resetDie() {
        self.modifier = 0
        self.totalDice = 1
    }

    
    //  Function to handle rolling the dice
    func rollDie() -> Int {
        print("Rolled \(description)")
        
        //  Use upperBound determined from switch statement to set the max possible value created using arc4random_uniform()
        var rollValue = UInt32()
        var i = totalDice
        while i > 0 {
            rollValue += arc4random_uniform(UInt32(sides))
            i -= 1
        }
        return Int((rollValue)) + 1 + modifier
    }
}

