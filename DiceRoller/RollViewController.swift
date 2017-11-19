//
//  ViewController.swift
//  DiceRoller
//
//  Created by Paul Malone on 8/11/17.
//  Copyright © 2017 stroggi. All rights reserved.
//

/* TODO:
    1. Add a settings screen with color palletes
    3. Add a log
 */
import UIKit

class RollViewController: UIViewController {
    
    //  Create the dice
    var dice = [Die(type: .d4, totalDice: 1 , modifier: 0),
               Die(type: .d6, totalDice: 1 , modifier: 0),
               Die(type: .d8, totalDice: 1 , modifier: 0),
               Die(type: .d10, totalDice: 1 , modifier: 0),
               Die(type: .d12, totalDice: 1 , modifier: 0),
               Die(type: .d20, totalDice: 1 , modifier: 0),
               Die(type: .d100, totalDice: 1 , modifier: 0)]
    
    // Create the timer
    var timer = Timer()
    let timerInterval = 0.3
    
    //  Outlet for result label
    @IBOutlet weak var resultLabel: UILabel!
   
    //  Outlet for dice roller buttons
    @IBOutlet var buttonText: [UIButton]!    
    
    // Outlets for rounding edges of buttons
    @IBOutlet var subtractDieLabel: [UIButton]!
    @IBOutlet var addDieLabel: [UIButton]!
    @IBOutlet var subtractModifierLabel: [UIButton]!
    @IBOutlet var addModifierLabel: [UIButton]!
    @IBOutlet weak var clearLabel: UIButton!
    @IBOutlet weak var settingsOutlet: UIButton!
    
    
    // Release button to end timer
    // This action is connected to touch up outside/inside for each button
    @IBAction func buttonReleased(_ sender: Any) {
        timer.invalidate()
    }
    
    // Press down on remove dice button
    @IBAction func removeDiceDown(_ sender: UIButton) {
        removeDice(senderTag: sender.tag)
        timer = Timer.scheduledTimer(withTimeInterval: timerInterval, repeats: true, block: {_ in self.removeDice(senderTag: sender.tag)})
    }
    
    // Function to remove dice
    func removeDice(senderTag: Int) {
        var dieToRemove = Die()
        
        // Figure out which dice to remove from
        switch senderTag {
        case 0:
            dieToRemove = dice[0]
            print("Remove 1d4")
        case 1:
            dieToRemove = dice[1]
            print("Remove 1d6")
        case 2:
            dieToRemove = dice[2]
            print("Remove 1d8")
        case 3:
            dieToRemove = dice[3]
            print("Remove 1d10")
        case 4:
            dieToRemove = dice[4]
            print("Remove 1d12")
        case 5:
            dieToRemove = dice[5]
            print("Remove 1d20")
        case 6:
            dieToRemove = dice[6]
            print("Remove 1d100")
        default:
            print("Error, invalid button tag")
        }
        
        // Actually remove the die
        dieToRemove.removeDie()
        
        // Update the button label, use sender.tag for the array index
        if dieToRemove.modifier < 0 {
            buttonText[senderTag].setTitle("\(dieToRemove.totalDice)\(dieToRemove.type)\(dieToRemove.modifier)", for: .normal)
        } else {
            buttonText[senderTag].setTitle("\(dieToRemove.totalDice)\(dieToRemove.type)+\(dieToRemove.modifier)", for: .normal)
        }
        
        // Update the actual die instance so every thing is up to date next time this is called.
        switch dieToRemove.type {
        case .d4:
            dice[0] = dieToRemove
        case .d6:
            dice[1] = dieToRemove
        case .d8:
            dice[2] = dieToRemove
        case .d10:
            dice[3] = dieToRemove
        case .d12:
            dice[4] = dieToRemove
        case .d20:
            dice[5] = dieToRemove
        case .d100:
            dice[6] = dieToRemove
        }
    }
    
    // Press and hold to add dice continuously
    @IBAction func addDiceDown(_ sender: UIButton) {
        addDice(senderTag: sender.tag)
        timer = Timer.scheduledTimer(withTimeInterval: timerInterval, repeats: true, block: {_ in self.addDice(senderTag: sender.tag)})
    }
    
    //  Function for adding dice
    func addDice(senderTag: Int) {
        var dieToAdd = Die()
        
        // Figure out which dice to remove from
        switch senderTag {
        case 0:
            dieToAdd = dice[0]
            print("Remove 1d4")
        case 1:
            dieToAdd = dice[1]
            print("Remove 1d6")
        case 2:
            dieToAdd = dice[2]
            print("Remove 1d8")
        case 3:
            dieToAdd = dice[3]
            print("Remove 1d10")
        case 4:
            dieToAdd = dice[4]
            print("Remove 1d12")
        case 5:
            dieToAdd = dice[5]
            print("Remove 1d20")
        case 6:
            dieToAdd = dice[6]
            print("Add 1d100")
        default:
            print("Error, invalid button tag")
        }
        
        // Actually remove the die
        dieToAdd.addDie()
        
        // Update the button label, use sender.tag for the array index
        if dieToAdd.modifier < 0 {
            buttonText[senderTag].setTitle("\(dieToAdd.totalDice)\(dieToAdd.type)\(dieToAdd.modifier)", for: .normal)
        } else {
            buttonText[senderTag].setTitle("\(dieToAdd.totalDice)\(dieToAdd.type)+\(dieToAdd.modifier)", for: .normal)
        }
        
        // Update the actual die instance so every thing is up to date next time this is called.
        switch dieToAdd.type {
        case .d4:
            dice[0] = dieToAdd
        case .d6:
            dice[1] = dieToAdd
        case .d8:
            dice[2] = dieToAdd
        case .d10:
            dice[3] = dieToAdd
        case .d12:
            dice[4] = dieToAdd
        case .d20:
            dice[5] = dieToAdd
        case .d100:
            dice[6] = dieToAdd
        }

    }
    
    //  Action for subtracting modifier
    @IBAction func removeModifierDown(_ sender: UIButton) {
        subtractModifier(senderTag: sender.tag)
        timer = Timer.scheduledTimer(withTimeInterval: timerInterval, repeats: true, block: {_ in self.subtractModifier(senderTag: sender.tag)})
    }
    
    func subtractModifier(senderTag: Int) {
        var modifierToSubtract = Die()
        
        // Figure out which dice to remove from
        switch senderTag {
        case 0:
            modifierToSubtract = dice[0]
            print("Subtract 1")
        case 1:
            modifierToSubtract = dice[1]
            print("Subtract 1")
        case 2:
            modifierToSubtract = dice[2]
            print("Subtract 1")
        case 3:
            modifierToSubtract = dice[3]
            print("Subtract 1")
        case 4:
            modifierToSubtract = dice[4]
            print("Subtract 1")
        case 5:
            modifierToSubtract = dice[5]
            print("Subtract 1")
        case 6:
            modifierToSubtract = dice[6]
            print("Subtract 1")
        default:
            print("Error, invalid button tag")
        }
        
        // Actually remove the die
        modifierToSubtract.removeModifier()
        
        // Update the button label, use sender.tag for the array index
        if modifierToSubtract.modifier < 0 {
            buttonText[senderTag].setTitle("\(modifierToSubtract.totalDice)\(modifierToSubtract.type)\(modifierToSubtract.modifier)", for: .normal)
        } else {
            buttonText[senderTag].setTitle("\(modifierToSubtract.totalDice)\(modifierToSubtract.type)+\(modifierToSubtract.modifier)", for: .normal)
        }
        
        // Update the actual die instance so every thing is up to date next time this is called.
        switch modifierToSubtract.type {
        case .d4:
            dice[0] = modifierToSubtract
        case .d6:
            dice[1] = modifierToSubtract
        case .d8:
            dice[2] = modifierToSubtract
        case .d10:
            dice[3] = modifierToSubtract
        case .d12:
            dice[4] = modifierToSubtract
        case .d20:
            dice[5] = modifierToSubtract
        case .d100:
            dice[6] = modifierToSubtract
        }

    }
    
    //  Action for adding modifier
    @IBAction func addModifierDown(_ sender: UIButton) {
        addModifier(senderTag: sender.tag)
        timer = Timer.scheduledTimer(withTimeInterval: timerInterval, repeats: true, block: {_ in self.addModifier(senderTag: sender.tag)})
    }
    func addModifier(senderTag: Int) {
        var modifierToAdd = Die()
        
        // Figure out which dice to remove from
        switch senderTag {
        case 0:
            modifierToAdd = dice[0]
            print("Remove 1d4")
        case 1:
            modifierToAdd = dice[1]
            print("Remove 1d6")
        case 2:
            modifierToAdd = dice[2]
            print("Remove 1d8")
        case 3:
            modifierToAdd = dice[3]
            print("Remove 1d10")
        case 4:
            modifierToAdd = dice[4]
            print("Remove 1d12")
        case 5:
            modifierToAdd = dice[5]
            print("Remove 1d20")
        case 6:
            modifierToAdd = dice[6]
            print("Remove 1d100")
        default:
            print("Error, invalid button tag")
        }
        
        // Actually remove the die
        modifierToAdd.addModifier()
        
        // Update the button label, use sender.tag for the array index
        if modifierToAdd.modifier < 0 {
            buttonText[senderTag].setTitle("\(modifierToAdd.totalDice)\(modifierToAdd.type)\(modifierToAdd.modifier)", for: .normal)
        } else {
            buttonText[senderTag].setTitle("\(modifierToAdd.totalDice)\(modifierToAdd.type)+\(modifierToAdd.modifier)", for: .normal)
        }
        
        // Update the actual die instance so every thing is up to date next time this is called.
        switch modifierToAdd.type {
        case .d4:
            dice[0] = modifierToAdd
        case .d6:
            dice[1] = modifierToAdd
        case .d8:
            dice[2] = modifierToAdd
        case .d10:
            dice[3] = modifierToAdd
        case .d12:
            dice[4] = modifierToAdd
        case .d20:
            dice[5] = modifierToAdd
        case .d100:
            dice[6] = modifierToAdd
        }

    }
    
    // Action for rolling dice
    @IBAction func diceRollPressed(_ sender: UIButton) {
        var dieToRoll = Die()
        
        // Figure out what die to roll based on button tags
        switch sender.tag {
        case 0:
            dieToRoll = dice[0]
            print("Rolled d4")
        case 1:
            dieToRoll = dice[1]
            print("Rolled d6")
        case 2:
            dieToRoll = dice[2]
            print("Rolled d8")
        case 3:
            dieToRoll = dice[3]
            print("Rolled d10")
        case 4:
            dieToRoll = dice[4]
            print("Rolled d12")
        case 5:
            dieToRoll = dice[5]
            print("Rolled d20")
        case 6:
            dieToRoll = dice[6]
            print("Rolled d100")
        default:
            print("Error, invalid dice tag")
        }
        
        // Update the results label
        resultLabel.text = "\(dieToRoll.rollDie())"
        
        // Update the title on the button
        if dieToRoll.modifier < 0 {
            sender.setTitle("\(dieToRoll.totalDice)\(dieToRoll.type)\(dieToRoll.modifier)", for: .normal)
        } else {
            sender.setTitle("\(dieToRoll.totalDice)\(dieToRoll.type)+\(dieToRoll.modifier)", for: .normal)
        }
        
    }
    
    // Action for clearing all modifiers and reset labels
    @IBAction func clearButtonPressed(_ sender: UIButton) {
        // Clear result label
        resultLabel.text = ""
        
        // Reset modifiers
        // Loop through the array of dice and call the resetDie() method on it
        var i = 0
        while i < dice.count {
            dice[i].resetDie()
            i += 1
        }
        
        // Reset die labels
        // Loop through each button and reset everything.
        i = 0
        while i < dice.count {
            buttonText[i].setTitle("\(dice[i].totalDice)\(dice[i].type)+\(dice[i].modifier)", for: .normal)
            i += 1
        }
    }
    
    // Function to make buttons rounded
    func roundButtons() {
        for i in 0...buttonText.count - 1 {
            buttonText[i].layer.cornerRadius = 15
            subtractDieLabel[i].layer.cornerRadius = 25
            addDieLabel[i].layer.cornerRadius = 25
            subtractModifierLabel[i].layer.cornerRadius = 25
            addModifierLabel[i].layer.cornerRadius = 25
            settingsOutlet.layer.cornerRadius = 25
        }
        
        clearLabel.layer.cornerRadius = 20
    }
    
    // Stuff to hide the navigation bar
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        // Hide the navigation bar on the this view controller
        self.navigationController?.setNavigationBarHidden(true, animated: animated)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        // Show the navigation bar on other view controllers
        self.navigationController?.setNavigationBarHidden(false, animated: animated)
    }
    
        override func viewDidLoad() {
            super.viewDidLoad()
            roundButtons()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

